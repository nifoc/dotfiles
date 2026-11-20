{ den, ... }:

{
  den.aspects.unifi-os-proxy = {
    nixos =
      { config, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
        inherit (den.aspects.base.meta.networking) ips;

        siliconIP = builtins.head ips.tailscale.silicon;
      in
      {
        services.caddy = {
          virtualHosts."unifi.internal.kempkens.network" = {
            listenAddresses = [
              networkConfig.tailscale.ipv4
              "[${networkConfig.tailscale.ipv6}]"
            ];

            extraConfig = ''
              encode

              reverse_proxy ${siliconIP}:11443 {
                header_up Host {upstream_hostport}
                header_up Origin ""

                transport http {
                  tls
                  tls_insecure_skip_verify
                }
              }
            '';
          };

          globalConfig = ''
            layer4 {
              ${networkConfig.mgmt.ipv4}:8080 {
                route {
                  proxy ${siliconIP}:8080
                }
              }
            }
          '';
        };

        networking.firewall.interfaces."${networkConfig.mgmt.name}" = {
          allowedTCPPorts = [ 8080 ];
        };
      };
  };
}
