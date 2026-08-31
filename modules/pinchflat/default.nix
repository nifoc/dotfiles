{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.pinchflat = {
    nixos =
      { config, lib, ... }:
      let
        requiredPaths = [
          "/dozer/MediaVault/Pinchflat"
        ];
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          pinchflat-config = {
            file = ../../agenix/pinchflat/config.age;
          };
        };

        services.pinchflat = {
          enable = true;
          user = "media_user";
          group = "user_media";
          openFirewall = false;

          secretsFile = config.age.secrets.pinchflat-config.path;

          mediaDir = "/dozer/MediaVault/Pinchflat";

          extraConfig = {
            UMASK = "002";
            YT_DLP_WORKER_CONCURRENCY = "1";
          };
        };

        systemd = {
          services.pinchflat = {
            wantedBy = lib.mkForce [ ];

            unitConfig = {
              ConditionDirectoryNotEmpty = requiredPaths;
            };
          };

          paths.pinchflat = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };
        };
      };
  };
}
