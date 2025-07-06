{ config, ... }:

let
  fqdn = "speedtest.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = "8082";
in
{
  virtualisation.oci-containers.containers.speedtest-tracker = {
    image = "lscr.io/linuxserver/speedtest-tracker:latest";
    ports = [ "${internalIP}:${internalPort}:80" ];
    environment = {
      "PUID" = "2001";
      "PGID" = "2001";
      #"APP_DEBUG" = "true";
      "ASSET_URL" = "https://${fqdn}";
      "DISPLAY_TIMEZONE" = "Europe/Berlin";
      "DATETIME_FORMAT" = "d.m.Y H:i";
      "CHART_DATETIME_FORMAT" = "j. M. - H:i";
      "SPEEDTEST_SCHEDULE" = "0 */4 * * *";
      "SPEEDTEST_SERVERS" = "69359,17392,35154,48091";
      "SPEEDTEST_BLOCKED_SERVERS" = "61977";
    };
    environmentFiles = [
      config.age.secrets.speedtest-tracker-environment.path
    ];
    volumes = [
      "/var/lib/speedtest-tracker:/config"
    ];
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd = {
    services.podman-speedtest-tracker = {
      requires = [ "postgresql.service" ];

      restartTriggers = [ "${config.age.secrets.speedtest-tracker-environment.file}" ];
    };

    tmpfiles.rules = [
      "d /var/lib/speedtest-tracker 0755 media_user user_media"
    ];
  };

  services.caddy = {
    virtualHosts."${fqdn}" = {
      useACMEHost = "internal.kempkens.network";

      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        forward_auth unix/${config.services.tailscaleAuth.socketPath} {
          uri /auth
          header_up Remote-Addr {remote_host}
          header_up Remote-Port {remote_port}
          header_up Original-URI {uri}
          copy_headers {
            Tailscale-User>X-Webauth-User
            Tailscale-Name>X-Webauth-Name
            Tailscale-Login>X-Webauth-Login
            Tailscale-Tailnet>X-Webauth-Tailnet
            Tailscale-Profile-Picture>X-Webauth-Profile-Picture
          }
        }

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
