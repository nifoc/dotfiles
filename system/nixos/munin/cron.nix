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

    nginx =
      let
        fqdn = "munin.internal.kempkens.network";
      in
      {
        tailscaleAuth.virtualHosts = [ fqdn ];

        virtualHosts."${fqdn}" = {
          quic = true;
          http3 = true;
          kTLS = true;

          root = "/var/www/munin";

          onlySSL = true;
          useACMEHost = "internal.kempkens.network";
        };
      };
  };
}
