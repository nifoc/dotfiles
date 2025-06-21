{ config, ... }:

let
  fqdn = "speedtest.internal.kempkens.network";
in
{
  virtualisation.oci-containers.containers.speedtest-tracker = {
    image = "lscr.io/linuxserver/speedtest-tracker:latest";
    ports = [ "127.0.0.1:8082:80" ];
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

  services.nginx = {
    tailscaleAuth.virtualHosts = [ fqdn ];

    virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8082";
        proxyWebsockets = true;
      };
    };
  };
}
