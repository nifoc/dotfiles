{
  den.aspects.immich = {
    nixos =
      { lib, ... }:
      let
        host = "localhost";

        requiredPaths = [
          "/dozer/MediaVault/Immich"
          "/dozer/JailVault/media-scraper/Galleries"
        ];
      in
      {
        services = {
          immich = {
            enable = true;

            inherit host;

            mediaLocation = "/dozer/MediaVault/Immich";

            database = {
              enable = true;
              createDB = true;
            };
          };

          immich.machine-learning = {
            enable = true;

            environment = {
              IMMICH_HOST = lib.mkForce host;
            };
          };
        };

        systemd = {
          services.immich-server = {
            wantedBy = lib.mkForce [ ];

            unitConfig = {
              ConditionDirectoryNotEmpty = requiredPaths;
            };

            serviceConfig = {
              BindReadOnlyPaths = [
                "/dozer/JailVault/media-scraper/Galleries"
              ];
            };
          };

          paths.immich-server = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };
        };
      };
  };
}
