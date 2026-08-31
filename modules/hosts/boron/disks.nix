{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.boron.nixos = {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.devices.disk = {
      root = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
            };
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
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
  };
}
