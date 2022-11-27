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

      cloudflared = {
        service = {
          image = "cloudflare/cloudflared:latest";
          container_name = "cloudflared";
          restart = "unless-stopped";
          command = [ "tunnel" "--no-autoupdate" "run" "--token" secret.container.webserver.cloudflared.config.token ];
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

      # Matrix

      # synapse = {
      #   service = {
      #     image = "matrixdotorg/synapse:latest";
      #     container_name = "synapse";
      #     restart = "unless-stopped";
      #     depends_on = [ "ipv6nat" ];
      #     networks = [ "webserver" ];
      #     volumes = [
      #       "/etc/container-matrix/synapse:/data"
      #       "/etc/container-matrix/telegram:/bridge-data/telegram:ro"
      #       "/etc/container-matrix/signal:/bridge-data/signal:ro"
      #       "/etc/container-matrix/whatsapp:/bridge-data/whatsapp:ro"
      #     ];
      #     labels = {
      #       "com.centurylinklabs.watchtower.enable" = "true";
      #     };
      #   };
      # };
      #
      # matrix-telegram = {
      #   service = {
      #     image = "dock.mau.dev/mautrix/telegram:latest";
      #     container_name = "mautrix-telegram";
      #     restart = "unless-stopped";
      #     depends_on = [
      #       "ipv6nat"
      #       "synapse"
      #     ];
      #     networks = [ "webserver" ];
      #     volumes = [
      #       "/etc/container-matrix/telegram:/data"
      #     ];
      #     labels = {
      #       "com.centurylinklabs.watchtower.enable" = "true";
      #     };
      #   };
      # };
      #
      # signald = {
      #   service = {
      #     image = "signald/signald:latest";
      #     container_name = "signald";
      #     restart = "unless-stopped";
      #     depends_on = [ "ipv6nat" ];
      #     networks = [ "webserver" ];
      #     volumes = [
      #       "/etc/container-matrix/signald:/signald"
      #     ];
      #     labels = {
      #       "com.centurylinklabs.watchtower.enable" = "true";
      #     };
      #   };
      # };
      #
      # matrix-signal = {
      #   service = {
      #     image = "dock.mau.dev/mautrix/signal:latest";
      #     container_name = "mautrix-signal";
      #     restart = "unless-stopped";
      #     depends_on = [
      #       "ipv6nat"
      #       "synapse"
      #       "signald"
      #     ];
      #     networks = [ "webserver" ];
      #     volumes = [
      #       "/etc/container-matrix/signal:/data"
      #       "/etc/container-matrix/signald:/signald"
      #     ];
      #     labels = {
      #       "com.centurylinklabs.watchtower.enable" = "true";
      #     };
      #   };
      # };
      #
      # matrix-whatsapp = {
      #   service = {
      #     image = "dock.mau.dev/mautrix/whatsapp:latest";
      #     container_name = "mautrix-whatsapp";
      #     restart = "unless-stopped";
      #     depends_on = [
      #       "ipv6nat"
      #       "synapse"
      #     ];
      #     networks = [ "webserver" ];
      #     volumes = [
      #       "/etc/container-matrix/whatsapp:/data"
      #     ];
      #     labels = {
      #       "com.centurylinklabs.watchtower.enable" = "true";
      #     };
      #   };
      # };
    };
  };
} // custom-config
