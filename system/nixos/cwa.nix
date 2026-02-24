let
  fqdn = "cwa.internal.kempkens.network";
  internalIP = "192.168.42.6";
  internalPort = 8083;
  netns = "sc";
  requiredPaths = [
    "/dozer/MediaVault"
  ];
in
{
  virtualisation.quadlet.containers.cwa = {
    autoStart = false;

    containerConfig = {
      image = "ghcr.io/crocodilestick/calibre-web-automated:v4.0.6";
      environments = {
        PUID = "2001";
        PGID = "2001";
        TZ = "Europe/Berlin";
        NETWORK_SHARE_MODE = "false";
        CWA_PORT_OVERRIDE = toString internalPort;
      };
      networks = [ "ns:/var/run/netns/${netns}" ];
      volumes = [
        "/var/lib/cwa/config:/config"
        "/dozer/MediaVault/CWA/ingest:/cwa-book-ingest"
        "/dozer/MediaVault/CWA/library:/calibre-library"
      ];
    };

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      After = [ "wg-${netns}.service" ];

      ConditionDirectoryNotEmpty = requiredPaths;
    };
  };

  systemd = {
    paths.cwa = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };

    tmpfiles.rules = [
      "d /var/lib/cwa 0755 media_user user_media"
      "d /var/lib/cwa/config 0755 media_user user_media"
    ];
  };

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        request_body {
          max_size 256MB
        }

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${toString internalPort}
      '';
    };
  };
}
