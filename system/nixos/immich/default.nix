args@{
  lib,
  config,
  host ? "localhost",
  ...
}:

let
  requiredPaths = [
    "/dozer/MediaVault/Immich"
    "/dozer/JailVault/media-scraper/Galleries"
  ];
in
{
  imports = [
    (import ./machine-learning.nix (
      args
      // {
        inherit host;
      }
    ))
  ];

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

  services = {
    immich = {
      enable = true;

      inherit host;

      mediaLocation = "/dozer/MediaVault/Immich";

      database = {
        enable = true;
        createDB = true;

        enableVectorChord = true;
        enableVectors = false;
      };
    };

    caddy.virtualHosts = {
      "immich.internal.kempkens.network" = {

        extraConfig = ''
          encode

          request_body {
            max_size 1GB 
          }

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          reverse_proxy ${config.services.immich.host}:${toString config.services.immich.port} {
            flush_interval -1
          }
        '';
      };
    };

    restic.backups.secondary.paths = [ config.services.immich.mediaLocation ];
  };
}
