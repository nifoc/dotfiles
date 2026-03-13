{ config, lib, ... }:

let
  fqdn = "id.kempkens.network";
in
{
  services = {
    pocket-id = {
      enable = true;

      credentials = {
        ENCRYPTION_KEY = config.age.secrets.pocket-id-encryption-key.path;
        MAXMIND_LICENSE_KEY = config.age.secrets.geoipupdate-license.path;
      };

      settings = {
        HOST = "127.0.0.1";
        PORT = 1411;
        APP_URL = "https://${fqdn}";
        TRUST_PROXY = true;

        DB_CONNECTION_STRING = "postgres:///pocket-id?host=/run/postgresql";

        ANALYTICS_DISABLED = true;
        VERSION_CHECK_DISABLED = true;
      };
    };

    postgresql = {
      ensureDatabases = [ "pocket-id" ];
      ensureUsers = [
        {
          name = "pocket-id";
          ensureDBOwnership = true;
        }
      ];
    };

    postgresqlBackup.databases = [ "pocket-id" ];

    restic.backups = {
      remote.paths = [ "/var/lib/pocket-id" ];
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import robots-txt-generic

        reverse_proxy ${config.services.pocket-id.settings.HOST}:${toString config.services.pocket-id.settings.PORT}
      '';
    };
  };

  systemd.services.pocket-id = {
    after = lib.mkAfter [ "postgresql.target" ];
    requires = lib.mkAfter [ "postgresql.target" ];
  };
}
