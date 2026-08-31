{
  den.aspects.jellyfin = {
    nixos = {
      services.restic.backups.remote.paths = [
        "/var/lib/jellyfin/config"
        "/var/lib/jellyfin/data"
      ];
    };
  };
}
