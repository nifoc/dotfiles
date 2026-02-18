{ pkgs, ... }:

let
  raspiUefi =
    let
      version = "1.50";
    in
    pkgs.stdenvNoCC.mkDerivation {
      inherit version;
      pname = "rpi4-uefi-firmware-images";
      src = pkgs.fetchzip {
        url = "https://github.com/pftf/RPi4/releases/download/v${version}/RPi4_UEFI_Firmware_v${version}.zip";
        hash = "sha256-g8046/Ox0hZgvU6u3ZfC6HMqoTME0Y7NsZD6NvUsp7w=";
        stripRoot = false;
      };
      nativeBuildInputs = [
        pkgs.python3Packages.virt-firmware
      ];
      dontFixUp = true;

      installPhase = ''
        runHook preInstall
        mkdir $out
        rm Readme.md

        # Remove the RAM limitation to allow the usage of the full 8 GB
        virt-fw-vars \
            --input RPI_EFI.fd \
            --output RPI_EFI.fd \
            --set-json <(cat <<EOF
        {
            "version": 2,
            "variables": [
                {
                    "name": "RamLimitTo3GB",
                    "guid": "cd7cc258-31db-22e6-9f22-63b0b8eed6b5",
                    "data": "00000000"
                }
            ]
        }
        EOF
        )

        cp -r ./. $out
        runHook postInstall
      '';
    };
in
{
  disko.devices = {
    disk = {
      root = {
        type = "disk";
        device = "/dev/disk/by-id/ata-Intenso_SSD_Sata_III_2025122901802";
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
                mountOptions = [ "umask=0077" ];
                postMountHook = toString (
                  pkgs.writeScript "postMountHook.sh" ''
                    cp --verbose -r ${raspiUefi}/* /mnt/boot/
                  ''
                );
              };
            };
            swap = {
              size = "4G";
              content = {
                type = "swap";
                randomEncryption = true;
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
        options.ashift = "9";
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
          "root/services/podman" = {
            type = "zfs_fs";
            options = {
              mountpoint = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };
        };
      };
    };
  };
}
