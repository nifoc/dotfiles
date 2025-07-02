{
  pkgs,
  lib,
  config,
  ...
}:

let
  home = "/var/lib/weewx-weather";
  pkg = pkgs.weewx;
in
{
  # weewx

  systemd.services.weewx =
    let
      mounts = [
        "var-lib-weewx\\x2dweather-weewx\\x2ddata.mount"
      ];
    in
    {
      description = "WeeWX";
      requires = [
        "time-sync.target"
        "mosquitto.service"
      ];
      bindsTo = mounts;
      after = [
        "network-online.target"
        "time-sync.target"
        "mosquitto.service"
      ] ++ mounts;
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      path = [ pkg ];

      environment = {
        HOME = home;
        LANG = "de_DE.UTF-8";
        TZ = "Europe/Berlin";
      };

      restartTriggers = [
        "${config.age.secrets.weewx-config.file}"
        "${config.age.secrets.weewx-skin.file}"
      ];

      serviceConfig = {
        WorkingDirectory = "${pkg}/home/weewx-data";
        User = "weewx";
        Group = "weewx";
        ExecStart = "${pkg}/bin/weewxd --config=${config.age.secrets.weewx-config.path}";
        ExecStopPost = "-!${lib.getExe pkgs.umount} ${home}/weewx-data";

        CapabilityBoundingSet = [ "" ];
        DeviceAllow = [ "" ];
        LockPersonality = true;
        PrivateDevices = true;
        PrivateUsers = true;
        ProcSubset = "pid";
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectProc = "invisible";
        RestrictAddressFamilies = [
          "AF_INET"
          "AF_INET6"
          "AF_UNIX"
        ];
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
        SystemCallFilter = [
          "@system-service"
          "~@privileged"
          "~@resources"
        ];
      };
    };

  systemd.tmpfiles.rules = [
    "d ${home} 0755 weewx weewx"
    "d ${home}/data 0755 weewx weewx"
    "d ${home}/data/db 0750 weewx weewx"
    "d ${home}/data/html 0755 weewx weewx"
    "d ${home}/data/html/wdc 0755 weewx weewx"
    "d ${home}/overlay 750 weewx weewx"
    "d ${home}/overlay/upper 750 weewx weewx"
    "d ${home}/overlay/upper/skins 750 weewx weewx"
    "d ${home}/overlay/upper/skins/weewx-wdc 750 weewx weewx"
    "d ${home}/overlay/work 750 weewx weewx"
    "d ${home}/weewx-data 750 weewx weewx"
  ];

  users.users.weewx = {
    group = "weewx";
    isSystemUser = true;
    inherit home;
    uid = 421;
  };

  users.groups.weewx = {
    gid = 421;
  };

  fileSystems.weewx-data = {
    fsType = "overlay";
    mountPoint = "${home}/weewx-data";

    overlay = {
      lowerdir = [ "${pkg}/home/weewx-data" ];
      upperdir = "${home}/overlay/upper";
      workdir = "${home}/overlay/work";
    };
  };

  # Dependencies

  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "de_DE.UTF-8/UTF-8"
  ];

  services = {
    mosquitto.listeners = [
      {
        address = "127.0.0.1";
        port = 9883;

        settings = {
          protocol = "websockets";
          allow_anonymous = true;
        };

        acl = [ "topic read weather/+" ];
      }
    ];

    caddy.virtualHosts."http://wetter.kempkens.io:7781" = {
      listenAddresses = [
        "100.88.88.45"
        "[fd7a:115c:a1e0::cb01:582d]"
      ];

      extraConfig = ''
        encode

        @html {
          file
          path *.html
        }

        @js_css {
          file
          path *.js *.css
        }

        header @html Cache-Control "public, max-age=60, immutable"
        header @js_css Cache-Control "public, max-age=600"

        root * ${home}/data/html/wdc
        reverse_proxy /mqtt 127.0.0.1:9883
        file_server
      '';
    };
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 7781 ];
}
