{ config, ... }:

{
  services =
    let
      host = "networked.systems";
      bind-address = "127.0.0.1";
      port = 8080;
    in
    {
      gotosocial = {
        enable = true;
        setupPostgresqlDB = true;

        settings = {
          inherit host bind-address port;
          application-name = "networked.systems GoToSocial";

          protocol = "https";

          storage-local-base-path = "/var/lib/gotosocial/storage";

          media-emoji-remote-max-size = "200KiB";
          media-remote-cache-days = 3;

          instance-languages = [ "en" "de" ];
          accounts-registration-open = false;
          landing-page-user = "daniel";
        };
      };

      nginx = {
        proxyCachePath.gts_api = {
          enable = true;
          keysZoneName = "cache_gts_api";
          inactive = "1w";
          maxSize = "200m";
        };

        virtualHosts = {
          "${host}" = {
            quic = true;
            http3 = true;
            kTLS = true;

            forceSSL = true;
            useACMEHost = host;

            extraConfig = ''
              access_log /var/log/nginx/access_${host}.log combined buffer=32k flush=5m;

              client_max_body_size 40m;

              add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
            '';

            locations =
              let
                gtsProxy = {
                  recommendedProxySettings = true;
                  proxyPass = "http://${bind-address}:${toString port}";
                };
              in
              {
                "/" = gtsProxy // { proxyWebsockets = true; };

                "~ /.well-known/(webfinger|host-meta)$" = gtsProxy // {
                  extraConfig = ''
                    proxy_cache cache_gts_api;
                    proxy_cache_key $scheme://$host$uri$is_args$query_string;
                    proxy_cache_valid 200 10m;
                    proxy_cache_use_stale error timeout updating http_429 http_500 http_502 http_503 http_504;
                    proxy_cache_background_update on;
                    proxy_cache_lock on;
                  '';
                };

                "~ ^\/users\/(?:[a-z0-9_\.]+)\/main-key$" = gtsProxy // {
                  extraConfig = ''
                    proxy_cache cache_gts_api;
                    proxy_cache_key $scheme://$host$uri;
                    proxy_cache_valid 200 604800s;
                    proxy_cache_use_stale error timeout updating http_429 http_500 http_502 http_503 http_504;
                    proxy_cache_background_update on;
                    proxy_cache_lock on;
                  '';
                };

                "/assets/" = {
                  alias = config.services.gotosocial.settings.web-asset-base-dir;

                  extraConfig = ''
                    autoindex off;
                    expires 5m;
                    add_header Cache-Control "public";
                  '';
                };

                "/fileserver/" = {
                  alias = "${config.services.gotosocial.settings.storage-local-base-path}/";
                  tryFiles = "$uri @fileserver";

                  extraConfig = ''
                    autoindex off;
                    expires 1w;
                    add_header Cache-Control "private, immutable";
                  '';
                };

                "@fileserver" = gtsProxy // { proxyWebsockets = true; };
              };
          };

          "www.${host}" = {
            quic = true;
            http3 = true;

            addSSL = true;
            useACMEHost = host;

            extraConfig = ''
              add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
            '';

            globalRedirect = host;
          };
        };
      };
    };
}
