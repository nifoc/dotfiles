{ config, ... }:

let
  secret = import ../../secret/container/weewx;
  data-dir = "/var/lib/weewx";
in
{
  # virtualisation.oci-containers.containers.weewx = {
  #   image = "git.kempkens.io/daniel/weewx-docker:latest";
  #   ports = [ "127.0.0.1:8000:8000" ];
  #   environment = {
  #     "TZ" = "Europe/Berlin";
  #   };
  #   volumes = [
  #     "${data-dir}:/data"
  #   ];
  #   extraOptions = [
  #     "--label=com.centurylinklabs.watchtower.enable=true"
  #     "--label=io.containers.autoupdate=registry"
  #   ];
  # };

  # systemd.services.podman-weewx.restartTriggers = [
  #   "${config.age.secrets.weewx-config.file}"
  #   "${config.age.secrets.weewx-skin.file}"
  # ];

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 421 421"
    "d ${data-dir}/html 0755 421 421"
    "d ${data-dir}/skin-wdc 0755 421 421"
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


  networking.firewall.interfaces =
    let
      mosquittoPorts = [ 1883 ];
    in
    {
      "tailscale0".allowedTCPPorts = mosquittoPorts;
      "podman+".allowedTCPPorts = mosquittoPorts;
    };

  services.nginx.virtualHosts."${secret.container.weewx.hostname}" = {
    quic = true;
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

    locations."/mqtt" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:9883";
      proxyWebsockets = true;
    };
  };
}
