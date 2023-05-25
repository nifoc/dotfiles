{ pkgs, lib, ... }:

{
  virtualisation.oci-containers.containers.radarr = {
    image = "lscr.io/linuxserver/radarr:latest";
    ports = [ "192.168.42.2:7878:7878" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/var/lib/radarr/.config/Radarr:/config"
      "/mnt/downloads:/mnt/downloads"
      "/mnt/media/Movies:/mnt/media/Movies"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-radarr =
    let
      mounts = [
        "mnt-media-Movies.mount"
        "mnt-downloads.mount"
      ];

      depends = [
        "podman-sabnzbd.service"
        "podman-qbittorrent.service"
      ];
    in
    {
      requires = lib.mkAfter (mounts ++ depends);
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ mounts ++ depends);
    };

  services.nginx.virtualHosts."radarr.internal.kempkens.network" = {
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
}
