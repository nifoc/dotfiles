{ config, ... }:

let
  inherit (config.virtualisation.quadlet) containers;

  fqdn = "radarr.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "7878";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
    "/dozer/media"
  ];
in
{
  virtualisation.quadlet.containers.radarr = {
    autoStart = false;

    containerConfig = {
      image = "lscr.io/linuxserver/radarr:latest";
      environments = {
        PUID = "2001";
        PGID = "2001";
        TZ = "Etc/UTC";
        RADARR__AUTH__TRUSTCGNATIPADDRESSES = "true";
      };
      volumes = [
        "/var/lib/radarr/.config/Radarr:/config"
        "/dozer/downloads:/mnt/downloads"
        "/dozer/media/Movies:/mnt/media/Movies"
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
    paths.radarr = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };

    tmpfiles.rules = [
      "d /var/lib/radarr 0755 media_user user_media"
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
