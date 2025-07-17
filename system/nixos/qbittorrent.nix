{
  pkgs,
  lib,
  ...
}:

let
  fqdn = "qbittorrent.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "8071";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
  ];
in
{
  virtualisation.oci-containers.containers.qbittorrent = {
    image = "lscr.io/linuxserver/qbittorrent:latest";
    ports = [ "${internalIP}:${internalPort}:8071" ];
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

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
