let
  secret = import ../../secret/container/webserver;
  custom-config = import ./config.nix { inherit secret; };
in
{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      cloudflared = {
        service = {
          image = "cloudflare/cloudflared:latest";
          container_name = "cloudflared";
          restart = "unless-stopped";
          command = [ "tunnel" "--no-autoupdate" "run" "--token" secret.container.webserver.cloudflared.config.token ];
          extra_hosts = [
            "host.docker.internal:host-gateway"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

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

      nifoc-pw-docs = {
        service = {
          image = "ghcr.io/nifoc/nifoc.pw-docs:master";
          container_name = "nifoc-pw-docs";
          restart = "unless-stopped";
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
          environment = {
            "TZ" = "Europe/Berlin";
          };
          volumes = [
            "/etc/container-webserver/weewx:/data"
          ];
          labels = secret.container.webserver.weewx.labels;
        };
      };
    };
  };
} // custom-config
