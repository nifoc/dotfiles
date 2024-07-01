{ pkgs, lib, config, ... }:

let
  home = "/var/lib/weewx-weather";
  pkg = pkgs.weewx;
  secret = import ../../secret/container/weewx;
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
      requires = [ "time-sync.target" "mosquitto.service" ];
      bindsTo = mounts;
      after = [ "network-online.target" "time-sync.target" "mosquitto.service" ] ++ mounts;
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

  users.groups.weewx = { gid = 421; };

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

  services.mosquitto.listeners = [
    {
      address = "0.0.0.0";
      port = 1883;

      settings = {
        protocol = "mqtt";
      };

      users = {
        weewx-proxy = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx-proxy.path;
          acl = [ "write weewx/+" ];
        };

        weewx = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx.path;
          acl = [ "read weewx/+" "write weather/+" ];
        };
      };
    }
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

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 1883 ];

  services.nginx.virtualHosts."${secret.container.weewx.hostname}" = {
    quic = true;
    http3 = true;
    kTLS = true;

    root = "${home}/data/html/wdc";
    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      index index.html;
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations = {
      "~* \.html$".extraConfig = ''
        expires modified 120s;
      '';

      "~* \.(js|css)$".extraConfig = ''
        expires 1h;
      '';

      "/mqtt" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:9883";
        proxyWebsockets = true;
      };
    };
  };
}
