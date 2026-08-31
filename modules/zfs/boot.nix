{ den, ... }:

{
  den.aspects.zfs = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta.zfs;
      in
      {
        boot = {
          supportedFilesystems = [ "zfs" ];

          zfs = {
            extraPools = (cfg.extraPools or [ ]);
            requestEncryptionCredentials = [ "zroot/root" ];
            forceImportRoot = false;
          };
        };
      };
  };
}
