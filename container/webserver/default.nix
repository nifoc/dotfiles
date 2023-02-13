let
  secret = import ../../secret/container/webserver;
  custom-config = import ./config.nix { inherit secret; };
in
{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      mosquitto = {
        service = {
          image = "eclipse-mosquitto:2";
          container_name = "mosquitto";
          restart = "unless-stopped";
          ports = [ "1883:1883" ];
          user = "nobody";
          volumes = [
            "/etc/container-webserver/mosquitto:/mosquitto/config:ro"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

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
            "/etc/container-webserver/weewx:/data"
          ];
          inherit (secret.container.webserver.weewx) labels;
        };
      };
    };
  };
} // custom-config
