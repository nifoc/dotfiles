{ lib, ... }:

let
  fqdn = "radarr.internal.kempkens.network";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
    "/dozer/media"
  ];
in
{
  virtualisation.oci-containers.containers.radarr = {
    image = "lscr.io/linuxserver/radarr:latest";
    ports = [ "192.168.42.2:7878:7878" ];
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
        PathExists = requiredPaths;
        DirectoryNotEmpty = requiredPaths;
      };
    };

    tmpfiles.rules = [
      "d /var/lib/radarr 0755 media_user user_media"
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
        proxyPass = "http://192.168.42.2:7878";
        proxyWebsockets = true;
      };
    };
  };
}
