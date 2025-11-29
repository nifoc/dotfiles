{ config, ... }:

let
  fqdn = "speedtest.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = "8082";
in
{
  virtualisation.quadlet.containers.speedtest-tracker = {
    containerConfig = {
      image = "lscr.io/linuxserver/speedtest-tracker:latest";
      publishPorts = [ "${internalIP}:${internalPort}:80" ];
      environments = {
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
      environmentFiles = [ config.age.secrets.speedtest-tracker-environment.path ];
      volumes = [ "/var/lib/speedtest-tracker:/config" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    unitConfig = {
      Requires = [ "postgresql.service" ];
      After = [ "postgresql.service" ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/speedtest-tracker 0755 media_user user_media"
  ];

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
