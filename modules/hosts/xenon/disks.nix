{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.xenon.nixos = {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.devices.disk = {
      root = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-YMTC_PC41Q-1TB-B_YMA61T0RA252920LTC";
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
