{
  den.aspects.immich = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.immich;
      in
      {
        services.restic.backups.secondary.paths = [ cfg.mediaLocation ];
      };
  };
}
