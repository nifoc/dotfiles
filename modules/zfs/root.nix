{ den, inputs, ... }:

{
  flake-file.inputs = {
    disko.url = "github:nix-community/disko";
  };

  den.aspects.zfs = {
    nixos =
      { config, ... }:
      let
        zfsCfg = den.aspects.${config.networking.hostName}.meta.zfs;
      in
      {
        imports = [ inputs.disko.nixosModules.disko ];

        disko.devices.zpool = {
          zroot = {
            type = "zpool";
            mode = (zfsCfg.mode or "");
            rootFsOptions = {
              mountpoint = "none";
              compression = "lz4";
              acltype = "posix";
              xattr = "sa";
              "com.sun:auto-snapshot" = "true";
            };
            options = {
              inherit (zfsCfg) ashift;
            };
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
            };
          };
        };
      };
  };
}
