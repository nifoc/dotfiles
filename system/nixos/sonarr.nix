{ config, ... }:

let
  inherit (config.virtualisation.quadlet) containers;

  fqdn = "sonarr.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "8989";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
    "/dozer/media"
    "/dozer/MediaVault"
  ];
in
{
  virtualisation.quadlet.containers.sonarr = {
    autoStart = false;

    containerConfig = {
      image = "lscr.io/linuxserver/sonarr:develop";
      environments = {
        PUID = "2001";
        PGID = "2001";
        TZ = "Etc/UTC";
        SONARR__AUTH__TRUSTCGNATIPADDRESSES = "true";
      };
      volumes = [
        "/var/lib/sonarr/.config/NzbDrone:/config"
        "/dozer/downloads:/mnt/downloads"
        "/dozer/media/TV Shows:/mnt/media/TV Shows"
        "/dozer/media/Documentaries:/mnt/media/Documentaries"
        "/dozer/MediaVault/Anime:/mnt/media/Anime"
      ];
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      Requires = [ containers.prowlarr.ref ];
      After = [
        containers.prowlarr.ref
        "wg-${netns}.service"
      ];

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
      "d /var/lib/sonarr 0755 media_user user_media"
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

        @autobrr {
          client_ip 192.168.42.10
        }

        handle @autobrr {
          reverse_proxy ${internalIP}:${internalPort}
        }

        handle {
          import tailscale-auth

          reverse_proxy ${internalIP}:${internalPort}
        }
      '';
    };
  };
}
