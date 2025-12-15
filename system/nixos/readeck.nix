{ config, ... }:

let
  fqdn = "readeck.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = 8020;
in
{
  services = {
    readeck = {
      enable = true;

      environmentFile = config.age.secrets.readeck-environment.path;

      settings = {
        main = {
          log_level = "info";
          log_format = "text";
        };

        server = {
          host = internalIP;
          port = internalPort;
        };

        database = {
          source = "postgres://readeck@localhost/readeck?host=/run/postgresql";
        };
      };
    };

    postgresql = {
      ensureDatabases = [ "readeck" ];

      ensureUsers = [
        {
          name = "readeck";
          ensureDBOwnership = true;
        }
      ];
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${toString internalPort}
      '';
    };
  };

  systemd.services.readeck = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };
}
