{ lib, ... }:

let
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
  virtualisation.oci-containers.containers.radarr = {
    image = "lscr.io/linuxserver/radarr:latest";
    ports = [ "${internalIP}:${internalPort}:7878" ];
    environment = {
      "PUID" = "2001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "RADARR__AUTH__TRUSTCGNATIPADDRESSES" = "true";
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

  systemd = {
    services.podman-radarr = {
      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    paths.podman-radarr = {
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

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
