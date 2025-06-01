{
  disko.devices = {
    disk = {
      disk1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204686N";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot0";
                mountOptions = [ "umask=0077" ];
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

      disk2 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S75CNX0Y204574J";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot1";
                mountOptions = [ "umask=0077" ];
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
        mode = "mirror";
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
            options = {
              mountpoint = "/nix";
              atime = "off";
            };
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
          "root/services/munin" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/lib/munin";
              compression = "zstd";
              atime = "off";
            };
            mountpoint = "/var/lib/munin";
          };
          "root/services/munin/www" = {
            type = "zfs_fs";
            options = {
              mountpoint = "/var/www/munin";
              compression = "lz4";
              atime = "off";
              "com.sun:auto-snapshot" = "false";
            };
            mountpoint = "/var/www/munin";
          };
        };
      };
    };
  };
}
