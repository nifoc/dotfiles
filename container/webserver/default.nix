let
  secret = import ../../secret/container/webserver;
  custom-config = import ./config.nix { inherit secret; };
in
{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      ipv6nat = {
        service = {
          image = "robbertkl/ipv6nat:latest";
          container_name = "ipv6nat";
          restart = "unless-stopped";
          capabilities = {
            ALL = false;
            NET_ADMIN = true;
            NET_RAW = true;
          };
          network_mode = "host";
          volumes = [
            "/var/run/docker.sock:/var/run/docker.sock:ro"
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
          depends_on = [ "ipv6nat" ];
          networks = [ "webserver" ];
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

      traefik = {
        service = {
          image = "traefik:v2.8";
          container_name = "traefik";
          restart = "unless-stopped";
          depends_on = [ "ipv6nat" ];
          networks = [ "webserver" ];
          ports = [
            "80:80"
            "443:443"
          ];
          command = [ "--configFile=/traefik.toml" ];
          environment = secret.container.webserver.traefik.environment;
          volumes = [
            "/var/run/docker.sock:/var/run/docker.sock:ro"
            "/etc/container-webserver/traefik/traefik.toml:/traefik.toml:ro"
            "/etc/container-webserver/traefik/acme.json:/acme.json"
            "/etc/container-webserver/traefik/custom:/custom_config:ro"
          ];
          labels = secret.container.webserver.traefik.labels;
        };
      };

      ifconfig-sexy = {
        service = {
          image = "ghcr.io/nifoc/ifconfig.sexy-caddy:master";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "traefik"
          ];
          networks = [ "webserver" ];
          labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.ifconfig-sexy-http.rule" = "Host(`ifconfig.sexy`, `www.ifconfig.sexy`, `4.ifconfig.sexy`, `6.ifconfig.sexy`)";
            "traefik.http.routers.ifconfig-sexy-http.entrypoints" = "web";
            "traefik.http.routers.ifconfig-sexy-http.middlewares" = "https-redirect@file";
            "traefik.http.routers.ifconfig-sexy.rule" = "Host(`ifconfig.sexy`, `www.ifconfig.sexy`, `4.ifconfig.sexy`, `6.ifconfig.sexy`)";
            "traefik.http.routers.ifconfig-sexy.entrypoints" = "websecure";
            "traefik.http.routers.ifconfig-sexy.tls" = "true";
            "traefik.http.routers.ifconfig-sexy.tls.certresolver" = "cfresolver";
            "traefik.http.routers.ifconfig-sexy.middlewares" = "non-www-redirect@file, content-compression@file";
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      nifoc-pw-docs = {
        service = {
          image = "ghcr.io/nifoc/nifoc.pw-docs:master";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "traefik"
          ];
          networks = [ "webserver" ];
          labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.nifoc-pw-docs.rule" = "HostRegexp(`{subdomain:[a-z_]+}.nifoc.pw`)";
            "traefik.http.routers.nifoc-pw-docs.entrypoints" = "websecure";
            "traefik.http.routers.nifoc-pw-docs.tls" = "true";
            "traefik.http.routers.nifoc-pw-docs.tls.certresolver" = "cfresolver";
            "traefik.http.routers.nifoc-pw-docs.tls.domains[0].main" = "nifoc.pw";
            "traefik.http.routers.nifoc-pw-docs.tls.domains[0].sans" = "*.nifoc.pw";
            "traefik.http.routers.nifoc-pw-docs.middlewares" = "content-compression@file";
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      weewx = {
        service = {
          image = "ghcr.io/nifoc/weewx-docker:master";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "mosquitto"
            "traefik"
          ];
          networks = [ "webserver" ];
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

      synapse = {
        service = {
          image = "matrixdotorg/synapse:latest";
          container_name = "synapse";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "traefik"
          ];
          networks = [ "webserver" ];
          volumes = [
            "/etc/container-matrix/synapse:/data"
            "/etc/container-matrix/telegram:/bridge-data/telegram:ro"
            "/etc/container-matrix/signal:/bridge-data/signal:ro"
          ];
          labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.matrix.rule" = "Host(`matrix.kempkens.io`)";
            "traefik.http.routers.matrix.entrypoints" = "websecure";
            "traefik.http.routers.matrix.service" = "matrix-web";
            "traefik.http.routers.matrix.tls.certresolver" = "cfresolver";
            "traefik.http.routers.matrix.tls.domains[0].main" = "kempkens.io";
            "traefik.http.routers.matrix.tls.domains[0].sans" = "*.kempkens.io";
            "traefik.http.routers.matrix.middlewares" = "content-compression@file";
            "traefik.http.services.matrix-web.loadbalancer.server.port" = "8008";
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      matrix-telegram = {
        service = {
          image = "dock.mau.dev/mautrix/telegram:latest";
          container_name = "mautrix-telegram";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "synapse"
          ];
          networks = [ "webserver" ];
          volumes = [
            "/etc/container-matrix/telegram:/data"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      signald = {
        service = {
          image = "signald/signald:latest";
          container_name = "signald";
          restart = "unless-stopped";
          depends_on = [ "ipv6nat" ];
          networks = [ "webserver" ];
          volumes = [
            "/etc/container-matrix/signald:/signald"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      matrix-signal = {
        service = {
          image = "dock.mau.dev/mautrix/signal:latest";
          container_name = "mautrix-signal";
          restart = "unless-stopped";
          depends_on = [
            "ipv6nat"
            "synapse"
            "signald"
          ];
          networks = [ "webserver" ];
          volumes = [
            "/etc/container-matrix/signal:/data"
            "/etc/container-matrix/signald:/signald"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };

    networks.webserver = {
      driver = "bridge";
      enable_ipv6 = true;
      ipam = {
        driver = "default";
        config = [
          {
            subnet = "fd00:dead:beef::/48";
          }
        ];
      };
    };
  };
} // custom-config
