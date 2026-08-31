{
  den.aspects.audiobookshelf = {
    nixos =
      { lib, ... }:
      {
        services.audiobookshelf = {
          enable = true;
          user = "media_user";
          group = "user_media";
          openFirewall = false;

          host = "127.0.0.1";
          port = 8067;
        };

        systemd = {
          services.audiobookshelf = {
            wantedBy = lib.mkForce [ ];

            unitConfig = {
              ConditionDirectoryNotEmpty = [ "/dozer/MediaVault/Audio" ];
            };
          };

          paths.audiobookshelf = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };
        };
      };
  };
}
