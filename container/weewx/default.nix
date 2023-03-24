{ config, lib, ... }:

let
  secret = import ../../secret/container/weewx;
  data-dir = "/etc/container-weewx";
in
{
  virtualisation.oci-containers.containers.weewx = {
    image = "ghcr.io/nifoc/weewx-docker:master";
    ports = [ "127.0.0.1:8000:8000" ];
    environment = {
      "TZ" = "Europe/Berlin";
    };
    volumes = [
      "${data-dir}:/data"
    ];
    extraOptions = [
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-weewx.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 421 421"
    "d ${data-dir}/html 0755 421 421"
  ];

  environment.etc."container-weewx/weewx.conf" = {
    source = ../../secret/container/weewx/config/weewx.conf;
    mode = "0644";
    uid = 421;
    gid = 421;
  };

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
      };

      acl = [ "topic read weather/+" ];
    }
  ];


  networking.firewall.interfaces =
    let
      mosquittoPorts = [ 1883 ];
    in
    {
      "enp7s0".allowedTCPPorts = mosquittoPorts;
      "tailscale0".allowedTCPPorts = mosquittoPorts;
      "podman+".allowedTCPPorts = mosquittoPorts;
    };

  services.nginx.virtualHosts."${secret.container.weewx.hostname}" = {
    http3 = true;
    kTLS = true;

    root = "${data-dir}/html/wdc";
    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      index index.html;
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations."~* \.html$".extraConfig = ''
      expires modified 120s;
    '';

    locations."~* \.(js|css)$".extraConfig = ''
      expires 1h;
    '';

    locations."~ ^/dwd/(icons|warn_icons)/" = {
      root = "${data-dir}/static_html";
      extraConfig = ''
        expires 7d;
      '';
    };

    locations."~ ^/dwd/[\w]+\.(gif|png)".extraConfig = ''
      expires modified 1h;
    '';
  };
}
