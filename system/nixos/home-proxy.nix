{ pkgs, config, ... }:

let
  portI = 9918 + 10 - 7;
  portE = 9919 + 10 - 9;
  interface = config.systemd.network.networks."10-wan".matchConfig.Name;
in
{
  services.caddy = {
    globalConfig = ''
      layer4 {
        :${toString portE} {
          route {
            proxy {
              proxy_protocol v2
              upstream 100.83.191.69:${toString portI}
            }
          }
        }
      }
    '';

    virtualHosts."wetter.kempkens.io" = {
      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        header {
          Permissions-Policy interest-cohort=()
          Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
          X-Content-Type-Options nosniff
          X-Frame-Options DENY

          +X-Robots-Tag "noindex, nofollow"
          +X-Robots-Tag "noai, noimageai"
        }

        handle /robots.txt {
          rewrite * robots_generic.txt
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }

        handle {
          reverse_proxy 100.88.88.45:${toString (7780 + 1)}
        }
      '';
    };
  };

  networking.firewall.interfaces."${interface}".allowedTCPPorts = [ portE ];
}
