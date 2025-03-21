{ pkgs, config, ... }:

let
  server_name = "kempkens.io";
  fqdn = "matrix.${server_name}";
in
{
  services = {
    conduwuit = {
      enable = true;

      settings = {
        global = {
          address = [ "127.0.0.1" "::1" ];
          inherit server_name;

          allow_registration = false;
          allow_federation = true;
          allow_encryption = true;
          allow_check_for_updates = false;

          allow_legacy_media = false;

          url_preview_bound_interface = "eth0";

          new_user_displayname_suffix = "";
        };
      };
    };

    nginx.virtualHosts =
      let
        wellKnown = {
          "/.well-known/matrix/server" = {
            return = "200 '{\"m.server\": \"${fqdn}:443\"}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };

          "/.well-known/matrix/client" = {
            return = "200 '{\"m.server\": {\"base_url\": \"https://${fqdn}\"}, \"m.homeserver\": {\"base_url\": \"https://${fqdn}\"}, \"org.matrix.msc3575.proxy\": {\"url\": \"https://${fqdn}\"}}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };

          "/.well-known/matrix/support" = {
            return = "200 '{\"contacts\": [{\"role\": \"m.role.admin\", \"matrix_id\": \"@daniel:kempkens.io\", \"email_address\": \"daniel@kempkens.io\"}]}'";

            extraConfig = ''
              default_type application/json;
              more_set_headers 'Access-Control-Allow-Origin: "*"';
            '';
          };
        };
      in
      {
        "${server_name}".locations = wellKnown;

        "${fqdn}" = {
          quic = true;
          http3 = true;

          forceSSL = true;
          useACMEHost = "kempkens.io";

          extraConfig = ''
            access_log /var/log/nginx/access_${fqdn}.log combined_vhost buffer=32k flush=5m;

            client_max_body_size 20m;

            add_header Alt-Svc 'h3=":443"; ma=86400';
            add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
            add_header X-Content-Type-Options nosniff;
            add_header X-Frame-Options DENY;
            add_header X-XSS-Protection "1; mode=block";
          '';

          locations = {
            "= /" = {
              return = "200 'uwu~'";

              extraConfig = ''
                default_type text/plain;
              '';
            };

            "= /robots.txt".alias = "${pkgs.ai-robots-txt}/share/robots_generic.txt";

            "~* ^(\/_matrix|\/_conduwuit)" = {
              recommendedProxySettings = true;
              proxyPass = "http://127.0.0.1:${toString (builtins.elemAt config.services.conduwuit.settings.global.port 0)}";

              extraConfig = ''
                proxy_http_version 1.1;
                proxy_read_timeout 60s;
                proxy_send_timeout 60s;
              '';
            };
          } // wellKnown;
        };
      };
  };
}
