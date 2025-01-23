{
  disko.devices = {
    disk = {
      x = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              name = "boot";
              start = "0";
              end = "1M";
              part-type = "primary";
              flags = [ "bios_grub" ];
            }

            {
              name = "ESP";
              start = "1M";
              end = "1GiB";
              fs-type = "fat32";
              bootable = true;
              content = {
                type = "mdraid";
                name = "boot";
              };
            }

            {
              name = "zfs";
              start = "1GiB";
              end = "-1GiB";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            }

            {
              name = "swap";
              start = "-1GiB";
              end = "100%";
              part-type = "primary";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            }
          ];
        };
      };
      y = {
        type = "disk";
        device = "/dev/nvme1n1";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              name = "boot";
              start = "0";
              end = "1M";
              part-type = "primary";
              flags = [ "bios_grub" ];
            }

            {
              name = "ESP";
              start = "1M";
              end = "1GiB";
              fs-type = "fat32";
              bootable = true;
              content = {
                type = "mdraid";
                name = "boot";
              };
            }

            {
              name = "zfs";
              start = "1GiB";
              end = "-1GiB";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            }

            {
              name = "swap";
              start = "-1GiB";
              end = "100%";
              part-type = "primary";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            }
          ];
        };
      };
    };

    mdadm = {
      boot = {
        type = "mdadm";
        level = 1;
        metadata = "1.0";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";
        mode = "mirror";
        rootFsOptions = {
          compression = "lz4";
          "com.sun:auto-snapshot" = "true";
        };
        mountpoint = "/";
        postCreateHook = "zfs snapshot zroot@blank";

        datasets = {
          postgresql = {
            type = "zfs_fs";
            mountpoint = "/var/lib/postgresql";
            options = {
              recordsize = "16k";
              atime = "off";
            };
          };

          elasticsearch = {
            type = "zfs_fs";
            mountpoint = "/var/lib/elasticsearch";
            options = {
              atime = "off";
            };
          };

          mastodon = {
            type = "zfs_fs";
            mountpoint = "/var/lib/mastodon";
            options = {
              recordsize = "512k";
              atime = "off";
            };
          };

          synapse = {
            type = "zfs_fs";
            mountpoint = "/var/lib/matrix-synapse";
            options = {
              recordsize = "512k";
              atime = "off";
            };
          };

          forgejo = {
            type = "zfs_fs";
            mountpoint = "/var/lib/forgejo";
            options = {
              compression = "zstd";
              atime = "off";
            };
          };

          atticd-data = {
            type = "zfs_fs";
            mountpoint = "/var/lib/atticd-data";
            options = {
              atime = "off";
            };
          };
        };
      };
    };
  };
}
