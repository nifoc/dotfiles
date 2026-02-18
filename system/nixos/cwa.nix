{
  pkgs,
  #lib,
  #config,
  ...
}:

let
  #inherit (config.virtualisation.quadlet) containers;

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

    # services = {
    #   fanficfare-update = {
    #     description = "FanFicFare Update";
    #     startAt = "*-*-* 02,08,14,20:00:00";
    #     restartIfChanged = false;
    #
    #     bindsTo = [ "wg-${netns}.service" ];
    #     after = lib.mkAfter [ "wg-${netns}.service" ];
    #
    #     environment = {
    #       HOME = "/home/daniel";
    #     };
    #
    #     serviceConfig = {
    #       Type = "oneshot";
    #       User = "daniel";
    #       Group = "user_media";
    #       ExecStart = "${lib.getExe config.users.users.daniel.shell} /home/daniel/.zsh/server_functions/fanficfare-update";
    #
    #       NetworkNamespacePath = "/var/run/netns/${netns}";
    #       BindReadOnlyPaths = [
    #         "/etc/netns/${netns}/resolv.conf:/etc/resolv.conf:norbind"
    #         "/etc/netns/${netns}/nsswitch.conf:/etc/nsswitch.conf:norbind"
    #         "/etc/netns/${netns}/nscd-kill:/run/nscd:norbind"
    #       ];
    #
    #       DevicePolicy = "closed";
    #       LockPersonality = true;
    #       ProtectControlGroups = true;
    #       ProtectKernelModules = true;
    #       ProtectKernelTunables = true;
    #       PrivateDevices = true;
    #       PrivateTmp = true;
    #       RestrictNamespaces = true;
    #     };
    #
    #     unitConfig = {
    #       ConditionDirectoryNotEmpty = requiredPaths;
    #     };
    #   };
    # };
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

  environment.systemPackages = with pkgs; [
    fanficfare
  ];
}
