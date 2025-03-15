{
  services.nginx = {
    resolver.addresses = [ "1.1.1.1" ];

    proxyCachePath.wetter = {
      enable = true;
      keysZoneName = "cache_wetter";
      maxSize = "200m";
    };

    # streamConfig = ''
    #   resolver 1.1.1.1 ipv6=off;
    #
    #   upstream video {
    #     server ${secret.nginx.upstream.video.hostname}:${builtins.toString secret.nginx.upstream.video.upstreamPort};
    #   }
    #
    #   server {
    #     listen *:${builtins.toString secret.nginx.upstream.video.externalPort} fastopen=63 backlog=1023;
    #     listen [::]:${builtins.toString secret.nginx.upstream.video.externalPort} fastopen=63 backlog=1023;
    #
    #     proxy_protocol on;
    #     proxy_pass video;
    #   }
    # '';

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
          proxyPass = "http://100.88.88.45:7781";
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

  # networking.firewall.interfaces."enp41s0".allowedTCPPorts = [
  #   secret.nginx.upstream.video.externalPort
  # ];
}
