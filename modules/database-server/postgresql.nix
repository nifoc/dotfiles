{ den, inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.database-server = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        trustedInterfaces = cfg.firewall.trustedInterfaces;
      in
      {
        imports = [ inputs.disko.nixosModules.disko ];

        disko.devices.zpool.zroot.datasets = {
          "root/services/postgresql" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/postgresql";
              compression = "zstd";
              recordsize = "16k";
              atime = "off";
            };
            mountpoint = "/var/lib/postgresql";
          };
        };

        services = {
          postgresql = {
            enable = true;
            package = pkgs.postgresql_18_jit;
            enableJIT = true;

            enableTCPIP = true;

            settings = {
              full_page_writes = "off";
              wal_init_zero = "off";
              wal_recycle = "off";

              work_mem = "12MB";

              track_activities = "on";
              track_counts = "on";
              autovacuum = "on";

              shared_preload_libraries = "pg_stat_statements";
              compute_query_id = "on";
            };

            authentication = ''
              host all all 100.64.0.0/10 md5
              host all all 10.88.0.0/16 md5
            '';
          };

          postgresqlBackup = {
            enable = true;
            compression = "zstd";
            compressionLevel = 7;
          };

          restic.backups = lib.mkMerge [
            { remote.paths = [ config.services.postgresqlBackup.location ]; }

            (lib.mkIf (builtins.hasAttr "restic-secondary-password" config.age.secrets) {
              secondary.paths = [ config.services.postgresqlBackup.location ];
            })
          ];
        };

        networking.firewall.interfaces = builtins.listToAttrs (
          builtins.map (iface: {
            name = iface;
            value = {
              allowedTCPPorts = [ 5432 ];
            };
          }) (builtins.filter builtins.isString trustedInterfaces)
        );
      };
  };
}
