let
  fqdn = "sabnzbd.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "8080";
  netns = "dl";
  requiredPaths = [
    "/dozer/downloads"
  ];
in
{
  virtualisation.quadlet.containers.sabnzbd = {
    autoStart = false;

    containerConfig = {
      image = "lscr.io/linuxserver/sabnzbd:latest";
      environments = {
        "PUID" = "2001";
        "PGID" = "2001";
        "TZ" = "Etc/UTC";
      };
      volumes = [
        "/var/lib/sabnzbd:/config"
        "/dozer/downloads/SABnzbd:/mnt/downloads/SABnzbd"
      ];
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      After = [ "wg-${netns}.service" ];

      ConditionDirectoryNotEmpty = requiredPaths;
    };
  };

  systemd = {
    paths.sabnzbd = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        DirectoryNotEmpty = requiredPaths;
      };
    };

    tmpfiles.rules = [
      "d /var/lib/sabnzbd 0750 media_user user_media"
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
