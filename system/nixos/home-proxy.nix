{ config, ... }:

let
  portI = 9918 + 10 - 7;
  portE = 9919 + 10 - 9;
  interface = config.systemd.network.networks."10-wan".matchConfig.Name;
in
{
  services.nginx = {
    resolver = {
      addresses = [ "1.1.1.1" ];
      ipv6 = false;
    };

    proxyCachePath.wetter = {
      enable = true;
      keysZoneName = "cache_wetter";
      maxSize = "200m";
    };

    streamConfig = ''
      upstream video {
        server 100.88.216.110:${toString portI};
      }

      server {
        listen *:${toString portE} fastopen=63 backlog=1023;
        listen [::]:${toString portE} fastopen=63 backlog=1023;

        proxy_protocol on;
        proxy_pass video;
      }
    '';

    virtualHosts."wetter.kempkens.io" = {
      quic = true;
      http3 = true;
      kTLS = true;

      forceSSL = true;
      useACMEHost = "kempkens.io";

      extraConfig = ''
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
        add_header X-Robots-Tag "noindex, nofollow";
        add_header X-Robots-Tag "noai, noimageai";
      '';

      locations = {
        "/" = {
          recommendedProxySettings = true;
          proxyPass = "http://100.88.88.45:${toString (7780 + 1)}";
          proxyWebsockets = true;

          extraConfig = ''
            proxy_cache cache_wetter;
            proxy_cache_revalidate on;
            proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
            proxy_cache_background_update on;
            proxy_cache_lock on;
          '';
        };

        "= /robots.txt" = {
          return = "200 \"User-agent: *\\nDisallow: /\"";
        };
      };
    };
  };

  networking.firewall.interfaces."${interface}".allowedTCPPorts = [ portE ];
}
