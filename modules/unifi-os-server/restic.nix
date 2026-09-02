{
  den.aspects.unifi-os-server = {
    nixos =
      { config, ... }:
      let
        backupDir = "${config.services.unifi-os-server.stateDir}/unifi/backup";
      in
      {
        services.restic.backups.remote.paths = [ backupDir ];
      };
  };
}
