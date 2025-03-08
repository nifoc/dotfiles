{
  disko.devices = {
    disk = {
      root = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
    };
    zpool = {
      zroot = {
        type = "zpool";
        rootFsOptions = {
          mountpoint = "none";
          compression = "lz4";
          acltype = "posix";
          xattr = "sa";
          "com.sun:auto-snapshot" = "true";
        };
        options.ashift = "12";
        datasets = {
          "root" = {
            type = "zfs_fs";
            options = {
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              keylocation = "prompt";
            };
            mountpoint = "/";

          };
          "root/nix" = {
            type = "zfs_fs";
            options.mountpoint = "/nix";
            mountpoint = "/nix";
          };
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
          "root/services/podman" = {
            type = "zfs_fs";
            options = {
              mountpoint = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };
          "root/services/gotosocial" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/gotosocial";
              compression = "zstd";
              recordsize = "512k";
              atime = "off";
            };
            mountpoint = "/var/lib/gotosocial";
          };
          "root/services/forgejo" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/forgejo";
              compression = "zstd";
              atime = "off";
            };
            mountpoint = "/var/lib/forgejo";
          };
        };
      };
    };
  };
}
