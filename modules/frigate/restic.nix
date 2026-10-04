{
  den.aspects.frigate = {
    nixos = {
      services.restic.backups.remote.paths = [
        "/var/lib/frigate/config"
      ];
    };
  };
}
