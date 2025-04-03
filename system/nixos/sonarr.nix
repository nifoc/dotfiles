{ lib, ... }:

{
  virtualisation.oci-containers.containers.sonarr = {
    image = "lscr.io/linuxserver/sonarr:develop";
    ports = [ "192.168.42.2:8989:8989" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "SONARR__AUTH__TRUSTCGNATIPADDRESSES" = "true";
    };
    volumes = [
      "/var/lib/sonarr/.config/NzbDrone:/config"
      "/mnt/downloads:/mnt/downloads"
      "/mnt/media/TV Shows:/mnt/media/TV Shows"
      "/mnt/media/Documentaries:/mnt/media/Documentaries"
      "/mnt/media/Anime:/mnt/media/Anime"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-sonarr =
    let
      mounts = [
        "mnt-media-TV\\x20Shows.mount"
        "mnt-media-Documentaries.mount"
        "mnt-media-Anime.mount"
        "mnt-downloads.mount"
      ];
    in
    {
      requires = lib.mkAfter mounts;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ mounts);
    };

  services.nginx =
    let
      fqdn = "sonarr.internal.kempkens.network";
    in
    {
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
