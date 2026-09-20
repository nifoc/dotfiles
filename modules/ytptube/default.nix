{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.ytptube = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      let
        requiredPaths = [
          "/dozer/MediaVault"
        ];
      in
      {
        imports = [ inputs.quadlet-nix.nixosModules.quadlet ];

        virtualisation.quadlet.containers.ytptube = {
          autoStart = false;

          containerConfig = {
            image = "ghcr.io/arabcoders/ytptube:latest";
            user = "2001:2001";
            environments = {
              TZ = "Europe/Berlin";
              YTP_HOST = "10.0.200.100";
              YTP_PORT = "8081";
              YTP_FILE_LOGGING = "false";
              YTP_TEMP_PATH = "/downloads/tmp";
              YTP_DOWNLOAD_PATH = "/downloads/files";
              YTP_MAX_WORKERS = "5";
              YTP_MAX_WORKERS_PER_EXTRACTOR = "1";
              YTP_EXTRACT_INFO_CONCURRENCY = "1";
            };
            volumes = [
              "/var/lib/ytptube:/config"
              "/dozer/MediaVault/YTPTube:/downloads"
            ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };

          unitConfig = {
            ConditionDirectoryNotEmpty = requiredPaths;
          };
        };

        systemd = {
          paths.sonarr = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };

          tmpfiles.rules = [
            "d /var/lib/ytptube 0755 media_user user_media"
          ];
        };
      };
  };
}
