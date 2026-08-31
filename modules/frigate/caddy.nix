{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.frigate = {
    nixos =
      { config, lib, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
        inherit (den.aspects.base.meta.networking) ips;

        fqdn = "frigate.internal.kempkens.network";
        fqdnLocal = "frigate-local.internal.kempkens.network";
        internalIP = "127.0.0.1";
        internalPort = 8080;
      in
      {
        imports = [ inputs.quadlet-nix.nixosModules.quadlet ];

        services.caddy = {
          virtualHosts."${fqdn}" = {
            extraConfig = ''
              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              import tinyauth

              reverse_proxy ${internalIP}:${toString internalPort}
            '';
          };

          virtualHosts."${fqdnLocal}:5000" = {
            listenAddresses = [ networkConfig.default.ipv4 ];
            extraConfig = ''
              reverse_proxy 127.0.0.1:5000
            '';
          };
        };

        virtualisation.quadlet.containers.tinyauth.containerConfig.environments = {
          TINYAUTH_AUTH_SESSIONEXPIRY = "604800";
          TINYAUTH_APPS_FRIGATE_CONFIG_DOMAIN = fqdn;
          TINYAUTH_APPS_FRIGATE_IP_BYPASS = lib.strings.concatStringsSep "," (
            ips.tailscale.daniels-iphone
            ++ ips.tailscale.gerdas-iphone
            ++ ips.tailscale.udos-iphone
            ++ ips.lan.daniels-iphone
            ++ ips.lan.gerdas-iphone
            ++ ips.lan.udos-iphone
          );
        };

        networking.firewall.extraCommands = ''
          iptables -A INPUT -p tcp -s 10.0.0.230 --dport 5000 -j ACCEPT -i ${networkConfig.default.name}
        '';
      };
  };
}
