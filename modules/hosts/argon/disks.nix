{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";

    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.argon.nixos =
    { pkgs, inputs', ... }:
    {
      imports = [ inputs.disko.nixosModules.disko ];

      disko.devices.disk = {
        root = {
          type = "disk";
          device = "/dev/disk/by-id/ata-ORICO_251113BH51201906";
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
                      cp --verbose -r ${inputs'.nifoc-overlay.packages.raspberry-pi4-uefi-fw}/* /mnt/boot/
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
    };
}
