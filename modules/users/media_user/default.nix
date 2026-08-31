{ den, ... }:

{
  den.aspects.media_user = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
      in
      {
        users = {
          groups = {
            user_media.gid = 2001;
          };

          users = {
            media_user = {
              uid = 2001;
              group = "user_media";
              isSystemUser = true;
              description = "Media User";
              home = "/var/lib/media_user";
              createHome = true;
              autoSubUidGidRange = true;
            };

            ${cfg.primaryUser}.extraGroups = [ "user_media" ];
          };
        };
      };
  };
}
