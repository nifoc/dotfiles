{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.media-downloader = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      { lib, inputs', ... }:
      let
        inherit (den.aspects.base.meta.networking) ips;

        fqdn = "qbittorrent.internal.kempkens.network";

        requiredPaths = [
          "/dozer/downloads"
        ];

        nifocPkgs = inputs'.nifoc-overlay.packages;
      in
      {
        imports = [ inputs.quadlet-nix.nixosModules.quadlet ];

        virtualisation.quadlet.containers.qbittorrent = {
          autoStart = false;

          containerConfig = {
            image = "lscr.io/linuxserver/qbittorrent:latest";
            environments = {
              "PUID" = "2001";
              "PGID" = "2001";
              "TZ" = "Etc/UTC";
              "WEBUI_PORT" = "8071";
            };
            volumes = [
              "/var/lib/qbittorrent:/config"
              "/dozer/downloads/qBittorrent:/mnt/downloads/qBittorrent"
              "${nifocPkgs.vuetorrent}/share:/usr/local/share/vuetorrent:ro"
              "${nifocPkgs.torrent-best-blocklist}/share:/usr/local/share/best-blocklist:ro"
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
          paths.qbittorrent = {
            wantedBy = [ "multi-user.target" ];

            pathConfig = {
              DirectoryNotEmpty = requiredPaths;
            };
          };

          tmpfiles.rules = [
            "d /var/lib/qbittorrent 0750 media_user user_media"
          ];
        };

        services.caddy = {
          virtualHosts."${fqdn}" = {
            extraConfig = ''
              encode

              request_body {
                max_size 32MB
              }

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              import tinyauth

              reverse_proxy 192.168.42.2:8071
            '';
          };
        };

        virtualisation.quadlet.containers.tinyauth.containerConfig.environments = {
          TINYAUTH_APPS_QBITTORRENT_CONFIG_DOMAIN = fqdn;
          TINYAUTH_APPS_QBITTORRENT_IP_BYPASS = lib.strings.concatStringsSep "," ips.tailscale.daniels-iphone;
        };
      };
  };
}
