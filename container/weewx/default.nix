{ config, ... }:

let
  secret = import ../../secret/container/weewx;
  data-dir = "/etc/container-weewx";
in
{
  virtualisation.arion.projects.weewx.settings = {
    services = {
      weewx = {
        service = {
          image = "ghcr.io/nifoc/weewx-docker:master";
          container_name = "weewx";
          restart = "unless-stopped";
          depends_on = [ "mosquitto" ];
          ports = [ "127.0.0.1:8000:8000" ];
          environment = {
            "TZ" = "Europe/Berlin";
          };
          volumes = [
            "${data-dir}:/data"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
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

  services.mosquitto.listeners = {
    weewx-private = {
      address = "0.0.0.0";
      port = 1883;

      users = {
        weewx-proxy = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx-proxy.path;
          acl = [ "write weewx/+" ];
        };

        weewx = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx.path;
          acl = [ "read weewx/+" ];
        };
      };
    };
  };

  networking.firewall.interfaces."enp7s0".allowedTCPPorts = [ 1883 ];
  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 1883 ];

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
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8000";
    };

    locations."~ ^/dwd/[\w]+\.(gif|png)".extraConfig = ''
      expires modified 1h;
    '';
  };
}
