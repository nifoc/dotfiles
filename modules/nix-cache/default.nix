{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    disko.url = "github:nix-community/disko";
  };

  den.aspects.nix-cache = {
    nixos =
      { pkgs, config, ... }:
      let
        fqdn = "nix-cache.kempkens.network";
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.disko.nixosModules.disko
        ];

        age.secrets = {
          nix-cache-environment = {
            file = ../../agenix/nix-cache/environment.age;
          };
        };

        disko.devices.zpool.zroot.datasets = {
          "root/services/atticd-storage" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/atticd-storage";
              recordsize = "256k";
              atime = "off";
            };
            mountpoint = "/var/lib/atticd-storage";
          };
        };

        environment.systemPackages = with pkgs; [
          attic-client
        ];

        services = {
          atticd = {
            enable = true;

            environmentFile = config.age.secrets.nix-cache-environment.path;

            settings = {
              listen = "127.0.0.1:8081";
              database.url = "postgresql:///atticd?host=/run/postgresql&user=atticd";

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
        };

        systemd.services.atticd.serviceConfig = {
          Restart = "on-failure";
        };
      };
  };
}
