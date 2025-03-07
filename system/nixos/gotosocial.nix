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

      nginx.virtualHosts = {
        "${host}" = {
          quic = true;
          http3 = true;

          forceSSL = true;
          useACMEHost = host;

          extraConfig = ''
            add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
            client_max_body_size 40m;
          '';

          locations."/" = {
            recommendedProxySettings = true;
            proxyWebsockets = true;
            proxyPass = "http://${bind-address}:${toString port}";

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
}
