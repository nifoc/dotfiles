{ pkgs, lib, ... }:

let
  fqdn = "qbittorrent.internal.kempkens.network";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
  ];
in
{
  virtualisation.oci-containers.containers.qbittorrent = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    ports = [ "192.168.42.2:8071:8071" ];
    environment = {
      "PUID" = "2001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "WEBUI_PORT" = "8071";
    };
    volumes = [
      "/var/lib/qbittorrent:/config"
      "/dozer/downloads/qBittorrent:/mnt/downloads/qBittorrent"
      "${pkgs.vuetorrent}/share:/usr/local/share/vuetorrent:ro"
      "${pkgs.torrent-best-blocklist}/share:/usr/local/share/best-blocklist:ro"
    ];
    networks = [ "ns:/var/run/netns/${netns}" ];
    capabilities = {
      CAP_NET_RAW = true;
    };
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd = {
    services.podman-qbittorrent = {
      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    paths.podman-qbittorrent = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathExists = requiredPaths;
        DirectoryNotEmpty = requiredPaths;
      };
    };

    tmpfiles.rules = [
      "d /var/lib/qbittorrent 0750 media_user user_media"
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
        proxyPass = "http://192.168.42.2:8071";
      };
    };
  };
}
