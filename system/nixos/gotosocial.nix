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

          instance-languages = [
            "en"
            "de"
          ];
          accounts-registration-open = false;
          landing-page-user = "daniel";
        };
      };

      caddy.virtualHosts = {
        "${host}" = {
          useACMEHost = host;

          extraConfig = ''
            encode

            request_body {
              max_size 40MB
            }

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            reverse_proxy ${bind-address}:${toString port} {
              flush_interval -1
            }
          '';
        };

        "www.${host}" = {
          useACMEHost = host;

          extraConfig = ''
            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            redir https://${host}{uri} permanent
          '';
        };
      };
    };
}
