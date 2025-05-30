{ lib, ... }:

let
  fqdn = "sonarr.internal.kempkens.network";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
    "/dozer/media"
    "/dozer/MediaVault"
  ];
in
{
  virtualisation.oci-containers.containers.sonarr = {
    image = "lscr.io/linuxserver/sonarr:develop";
    ports = [ "192.168.42.2:8989:8989" ];
    environment = {
      "PUID" = "2001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "SONARR__AUTH__TRUSTCGNATIPADDRESSES" = "true";
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

  systemd = {
    services.podman-sonarr = {
      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    paths.podman-sonarr = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        DirectoryNotEmpty = requiredPaths;
      };
    };

    tmpfiles.rules = [
      "d /var/lib/sonarr 0755 media_user user_media"
    ];
  };

  services.nginx = {
    tailscaleAuth.virtualHosts = [ fqdn ];

    virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      extraConfig = ''
        client_max_body_size 32m;
      '';

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://192.168.42.2:8989";
        proxyWebsockets = true;
      };
    };
  };
}
