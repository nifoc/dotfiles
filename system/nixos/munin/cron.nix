{ pkgs, config, ... }:

{
  services = {
    munin-cron = {
      enable = true;

      hosts = ''
        [${config.networking.hostName}]
        address localhost

        [argon]
        address argon.ts.kempkens.network

        [neon]
        address neon.ts.kempkens.network

        [carbon]
        address carbon.ts.kempkens.network

        [boron]
        address boron.ts.kempkens.network
      '';

      extraGlobalConfig =
        let
          contrib = pkgs.fetchFromGitHub {
            owner = "munin-monitoring";
            repo = "contrib";
            rev = "172ce3c6709d297b9af46daaefdc6e2492bc68fe";
            hash = "sha256-qoqpZVarFRXxk0HVvsl9b+egyK5xEcmAIxKoIQxPRak=";
          };
        in
        ''
          tmpldir ${contrib}/templates/munstrap/templates
          staticdir ${contrib}/templates/munstrap/static
        '';
    };

    caddy =
      let
        fqdn = "munin.internal.kempkens.network";
      in
      {
        virtualHosts."${fqdn}" = {
          useACMEHost = "internal.kempkens.network";

          extraConfig = ''
            encode

            header Strict-Transport-Security "max-age=31536000; includeSubDomains"

            forward_auth unix/${config.services.tailscaleAuth.socketPath} {
              uri /auth
              header_up Remote-Addr {remote_host}
              header_up Remote-Port {remote_port}
              header_up Original-URI {uri}
              copy_headers {
                Tailscale-User>X-Webauth-User
                Tailscale-Name>X-Webauth-Name
                Tailscale-Login>X-Webauth-Login
                Tailscale-Tailnet>X-Webauth-Tailnet
                Tailscale-Profile-Picture>X-Webauth-Profile-Picture
              }
            }

            root * /var/www/munin
            file_server
          '';
        };
      };
  };
}
