{ pkgs, lib, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/qbittorrent 0750 media_user media_group"
  ];

  virtualisation.oci-containers.containers.qbittorrent = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    ports = [ "192.168.42.2:8071:8071" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "WEBUI_PORT" = "8071";
    };
    volumes = [
      "/var/lib/qbittorrent:/config"
      "/mnt/downloads:/mnt/downloads"
      "${pkgs.vuetorrent}/share:/usr/local/share/vuetorrent"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--cap-add=CAP_NET_RAW"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-qbittorrent =
    let
      mounts = [
        "mnt-downloads.mount"
      ];
    in
    {
      requires = lib.mkAfter mounts;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ mounts);

      serviceConfig = {
        TimeoutStopSec = lib.mkForce 10;
      };
    };

  services.nginx.virtualHosts."qbittorrent.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:8071";
    };
  };
}
