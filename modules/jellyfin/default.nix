{
  den.aspects.jellyfin = {
    nixos =
      { lib, ... }:
      let
        requiredPaths = [
          "/dozer/MediaVault/Anime"
          "/dozer/MediaVault/Deutsche Serien"
          "/dozer/media/Deutsche Filme"
          "/dozer/media/Documentaries"
          "/dozer/media/Movies"
          "/dozer/media/TV Shows"
          "/dozer/MediaVault/Pinchflat"
          "/dozer/MediaVault/YTDL"
        ];
      in
      {
        services.jellyfin = {
          enable = true;
          user = "media_user";
          group = "user_media";
          openFirewall = false;
        };

        systemd = {
          services.jellyfin = {
            wantedBy = lib.mkForce [ ];

            unitConfig = {
              ConditionDirectoryNotEmpty = requiredPaths;
            };

            serviceConfig = {
              BindReadOnlyPaths = [
                "/dozer/MediaVault/Anime:/mnt/media/Anime"
                "\"/dozer/media/Deutsche Filme\":\"/mnt/media/Deutsche Filme\""
                "\"/dozer/MediaVault/Deutsche Serien\":\"/mnt/media/Deutsche Serien\""
                "/dozer/media/Documentaries:/mnt/media/Documentaries"
                "/dozer/media/Movies:/mnt/media/Movies"
                "\"/dozer/media/TV Shows\":\"/mnt/media/TV Shows\""
                "/dozer/MediaVault/Pinchflat"
                "/dozer/MediaVault/YTDL"
              ];
            };
          };

          paths.jellyfin = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };
        };
      };
  };
}
