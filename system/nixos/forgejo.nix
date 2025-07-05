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

    caddy.virtualHosts."${fqdn}" = {
      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        request_body {
          max_size 4GB
        }

        header {
          Permissions-Policy interest-cohort=()
          >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

          +X-Robots-Tag "noindex, nofollow"
          +X-Robots-Tag "noai, noimageai"
        }

        handle /robots.txt {
          root * ${pkgs.ai-robots-txt}/share
          file_server
        }

        handle {
          reverse_proxy unix//run/forgejo/forgejo.sock
        }
      '';
    };
  };
}
