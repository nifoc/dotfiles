{
  config,
  ...
}:

let
  server_name = "kempkens.io";
  fqdn = "matrix.${server_name}";
in
{
  services.matrix-continuwuity = {
    enable = true;

    settings = {
      global = {
        inherit server_name;
        address = [
          "127.0.0.1"
          "::1"
        ];
        port = [ 6167 ];
        unix_socket_perms = 660;

        max_request_size = 20000000;

        allow_registration = false;
        allow_federation = true;
        allow_encryption = true;

        trusted_servers = [ "matrix.org" ];

        allow_legacy_media = false;

        url_preview_bound_interface = "eth0";

        new_user_displayname_suffix = "";
      };
    };
  };

  services = {
    caddy.virtualHosts =
      let
        wellKnown = ''
          header /.well-known/matrix/server {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/server <<JSON
            {"m.server": "${fqdn}:443"}
            JSON 200

          header /.well-known/matrix/client {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/client <<JSON
            {
              "m.server": {"base_url": "https://${fqdn}"},
              "m.homeserver": {"base_url": "https://${fqdn}"},
              "org.matrix.msc3575.proxy": {"url": "https://${fqdn}"}
            }
            JSON 200

          header /.well-known/matrix/support {
            Content-Type "application/json"
            Access-Control-Allow-Origin "*"
          }

          respond /.well-known/matrix/support <<JSON
            {
              "contacts": [{
                "role": "m.role.admin",
                "matrix_id": "@daniel:kempkens.io",
                "email_address": "daniel@kempkens.io"
              }]
            }
            JSON 200
        '';
      in
      {
        "${server_name}".extraConfig = wellKnown;

        "${fqdn}" = {
          useACMEHost = "kempkens.io";

          extraConfig = ''
            encode

            request_body {
              max_size 20MB
            }

            header {
              Permissions-Policy interest-cohort=()
              >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
              X-Content-Type-Options nosniff
              X-Frame-Options DENY
              X-XSS-Protection "1; mode=block"
            }

            header / {
              Content-Type "text/plain"
            }

            respond / "uwu ~" 200

            ${wellKnown}

            import robots-txt-generic

            @matrix {
              path /_matrix/*
              path /_conduwuit/*
              path /_continuwuity/*
            }

            reverse_proxy @matrix 127.0.0.1:${toString (builtins.elemAt config.services.matrix-continuwuity.settings.global.port 0)}
          '';
        };
      };
  };
}
