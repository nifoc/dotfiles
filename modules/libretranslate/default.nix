{ inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.libretranslate = {
    nixos = {
      imports = [ inputs.disko.nixosModules.disko ];

      disko.devices.zpool.zroot.datasets = {
        "root/services/prometheus" = {
          type = "zfs_fs";
          options = {
            mountpoint = "/var/lib/prometheus";
            compression = "zstd";
            atime = "off";
            "com.sun:auto-snapshot" = "false";
          };
          mountpoint = "/var/lib/prometheus";
        };
      };

      services.libretranslate = {
        enable = true;

        domain = "translate.internal.kempkens.network";
        configureNginx = false;

        extraArgs = {
          load-only = "de,en,es,it";
        };
      };
    };
  };
}
