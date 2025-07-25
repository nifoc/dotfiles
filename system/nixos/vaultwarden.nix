{ pkgs, config, ... }:

let
  fqdn = "vault.kempkens.network";
in
{
  services = {
    vaultwarden = {
      enable = true;
      dbBackend = "postgresql";

      environmentFile = config.age.secrets.vaultwarden-config.path;
      config = {
        DOMAIN = "https://${fqdn}";
        SIGNUPS_ALLOWED = false;
        EXPERIMENTAL_CLIENT_FEATURE_FLAGS = "ssh-key-vault-item,ssh-agent";

        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;

        DATABASE_URL = "postgresql:///vaultwarden?host=/run/postgresql";

        USE_SENDMAIL = true;
        SMTP_FROM = "vaultwarden@kempkens.io";
        SENDMAIL_COMMAND = "${pkgs.system-sendmail}/bin/sendmail";

        PUSH_ENABLED = true;
      };
    };

    postgresql = {
      ensureDatabases = [ "vaultwarden" ];

      ensureUsers = [
        {
          name = "vaultwarden";
          ensureDBOwnership = true;
        }
      ];
    };

    postgresqlBackup.databases = [ "vaultwarden" ];

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        request_body {
          max_size 40MB
        }

        reverse_proxy ${config.services.vaultwarden.config.ROCKET_ADDRESS}:${toString config.services.vaultwarden.config.ROCKET_PORT} {
          header_up X-Real-IP {remote_host}
        }
      '';
    };
  };

  systemd.services.vaultwarden = {
    requires = [ "postgresql.service" ];
    restartTriggers = [ "${config.age.secrets.vaultwarden-config.file}" ];
  };
}
