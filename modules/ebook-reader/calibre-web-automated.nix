{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.ebook-reader = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      let
        fqdn = "cwa.internal.kempkens.network";
        internalIP = "192.168.42.6";
        internalPort = 8083;
        requiredPaths = [
          "/dozer/MediaVault"
        ];
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.calibre-web-automated = {
          autoStart = false;

          containerConfig = {
            image = "ghcr.io/crocodilestick/calibre-web-automated:v4.0.6";
            environments = {
              PUID = "2001";
              PGID = "2001";
              TZ = "Europe/Berlin";
              NETWORK_SHARE_MODE = "false";
              CWA_PORT_OVERRIDE = toString internalPort;
            };
            volumes = [
              "/var/lib/cwa/config:/config"
              "/dozer/MediaVault/CWA/ingest:/cwa-book-ingest"
              "/dozer/MediaVault/CWA/library:/calibre-library"
            ];
          };

          unitConfig = {
            ConditionDirectoryNotEmpty = requiredPaths;
          };
        };

        systemd = {
          paths.calibre-web-automated = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              PathModified = "/root/zfs-dozer-mount-common";
            };
          };

          tmpfiles.rules = [
            "d /var/lib/cwa 0755 media_user user_media"
            "d /var/lib/cwa/config 0755 media_user user_media"
          ];
        };

        services.caddy = {
          virtualHosts."${fqdn}" = {
            extraConfig = ''
              encode

              request_body {
                max_size 256MB
              }

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy ${internalIP}:${toString internalPort}
            '';
          };
        };
      };
  };
}
