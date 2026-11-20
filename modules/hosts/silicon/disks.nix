{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.silicon.nixos = {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.devices.disk = {
      root = {
        type = "disk";
        device = "/dev/disk/by-path/platform-4010000000.pcie-pci-0000:08:00.0";
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
  };
}
