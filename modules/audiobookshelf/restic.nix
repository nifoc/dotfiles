{
  den.aspects.audiobookshelf = {
    nixos = {
      services.restic.backups.remote.paths = [ "/var/lib/audiobookshelf/metadata/backups" ];
    };
  };
}
