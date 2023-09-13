{ pkgs, config, ... }:

let
  fqdn = "git.kempkens.io";
in
{
  services = {
    gitea = {
      enable = true;
      package = pkgs.forgejo;

      stateDir = "/var/lib/forgejo";

      database = {
        type = "postgres";
      };

      lfs.enable = true;

      appName = "kempkens.io Forge";

      settings = {
        server = {
          PROTOCOL = "http+unix";
          DOMAIN = fqdn;
          ROOT_URL = "https://${fqdn}/";
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
        };
      };
    };

    gitea-actions-runner = {
      package = pkgs.forgejo-actions-runner;

      instances = {
        tanker = {
          enable = true;
          url = "https://${fqdn}";

          name = "tanker";
          tokenFile = config.age.secrets.forgejo-actions-token.path;

          labels = [
            "ubuntu-latest-amd64:docker://ghcr.io/catthehacker/ubuntu:act-latest"
          ];
        };
      };
    };

    nginx.virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "kempkens.io";

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://unix:/run/gitea/gitea.sock";
      };
    };
  };
}
