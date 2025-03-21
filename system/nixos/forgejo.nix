{ pkgs, ... }:

let
  fqdn = "git.kempkens.io";
in
{
  services = {
    forgejo = {
      enable = true;
      package = pkgs.forgejo;

      stateDir = "/var/lib/forgejo";

      database = {
        type = "postgres";
      };

      lfs.enable = true;

      settings = {
        DEFAULT = {
          APP_NAME = "kempkens.io Forge";
        };

        server = {
          PROTOCOL = "http+unix";
          DOMAIN = fqdn;
          ROOT_URL = "https://${fqdn}/";
          LANDING_PAGE = "explore";
        };

        service = {
          DISABLE_REGISTRATION = true;
        };

        mailer = {
          ENABLED = true;
          PROTOCOL = "sendmail";
          FROM = "forgejo@mg.kempkens.io";
          SENDMAIL_PATH = "${pkgs.system-sendmail}/bin/sendmail";
        };

        session = {
          COOKIE_SECURE = true;
          SAME_SITE = "strict";
        };

        actions = {
          ENABLED = true;
        };

        other = {
          SHOW_FOOTER_VERSION = false;
          SHOW_FOOTER_TEMPLATE_LOAD_TIME = false;
        };
      };
    };

    nginx = {
      commonHttpConfig = ''
        map "$http_user_agent" $forgejo_loggable {
          default            1;
          "~*^connect-go.*$" 0;
        }
      '';

      virtualHosts."${fqdn}" = {
        quic = true;
        http3 = true;

        forceSSL = true;
        useACMEHost = "kempkens.io";

        extraConfig = ''
          access_log /var/log/nginx/access_${fqdn}.log combined_vhost buffer=32k flush=5m if=$forgejo_loggable;

          client_max_body_size 0;

          add_header Alt-Svc 'h3=":443"; ma=86400';
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
        '';

        locations = {
          "/" = {
            recommendedProxySettings = true;
            proxyPass = "http://unix:/run/forgejo/forgejo.sock";
          };

          "= /robots.txt".alias = "${pkgs.ai-robots-txt}/share/robots.txt";
        };
      };
    };
  };
}
