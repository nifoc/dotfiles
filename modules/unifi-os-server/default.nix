{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.unifi-os-server = {
    nixos = {
      imports = [ inputs.disko.nixosModules.disko ];

      disko.devices.zpool.zroot.datasets = {
        "root/services/unifi-os-server" = {
          type = "zfs_fs";
          options = {
            mountpoint = "/var/lib/unifi-os-server";
            atime = "off";
          };
          mountpoint = "/var/lib/unifi-os-server";
        };
      };
    };
  };
}
