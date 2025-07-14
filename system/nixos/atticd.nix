{ pkgs, config, ... }:

let
  fqdn = "nix-cache.kempkens.network";
in
{
  environment.systemPackages = [ pkgs.attic-client ];

  services = {
    atticd = {
      enable = true;
      #package = (pkgs.attic-server.override { nix = pkgs.nixVersions.stable_upstream; });

      environmentFile = config.age.secrets.atticd-environment.path;

      settings = {
        listen = "127.0.0.1:8081";
        database.url = "postgresql:///atticd?host=/run/postgresql";

        allowed-hosts = [ "${fqdn}" ];
        api-endpoint = "https://${fqdn}/";

        storage = {
          type = "local";
          path = "/var/lib/atticd-storage";
        };

        chunking = {
          nar-size-threshold = 64 * 1024; # 64 KiB
          min-size = 16 * 1024; # 16 KiB
          avg-size = 64 * 1024; # 64 KiB
          max-size = 256 * 1024; # 256 KiB
        };

        garbage-collection = {
          interval = "24 hours";
          default-retention-period = "2 weeks";
        };
      };
    };

    postgresql = {
      ensureDatabases = [ "atticd" ];

      ensureUsers = [
        {
          name = "atticd";
          ensureDBOwnership = true;
        }
      ];
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        request_body {
          max_size 2GB
        }

        reverse_proxy ${config.services.atticd.settings.listen} {
          flush_interval -1
        }
      '';
    };
  };

  systemd.services.atticd.serviceConfig = {
    Restart = "on-failure";
  };
}
