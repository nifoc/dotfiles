{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.zfs = {
    nixos =
      { config, ... }:
      {
        imports = [ inputs.disko.nixosModules.disko ];

        disko.devices.zpool.zroot.datasets = {
          "root/services/podman" = {
            type = "zfs_fs";
            options = {
              mountpoint = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };
        };

        virtualisation = {
          podman.extraPackages = [ config.boot.zfs.package ];

          containers.storage.settings.storage = {
            driver = "zfs";
            graphroot = "/var/lib/containers/storage";
            runroot = "/run/containers/storage";
            options.zfs.fsname = "zroot/root/services/podman";
          };
        };
      };
  };
}
