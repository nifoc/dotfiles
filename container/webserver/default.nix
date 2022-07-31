let
  secret = import ../../secret/container/webserver.nix;
  custom-config = import ./config.nix { inherit secret; };
in
{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      ipv6nat = {
        service = {
          image = "robbertkl/ipv6nat:latest";
          container_name = "ipv6nat";
          restart = "always";
          capabilities = {
            ALL = false;
            NET_ADMIN = true;
            NET_RAW = true;
          };
          network_mode = "host";
          volumes = [
            "/var/run/docker.sock:/var/run/docker.sock:ro"
          ];
        };
      };

      mosquitto = {
        service = {
          image = "eclipse-mosquitto:2";
          container_name = "mosquitto";
          restart = "always";
          depends_on = [ "ipv6nat" ];
          networks = [ "webserver" ];
          ports = [ "1883:1883" ];
          user = "nobody";
          volumes = [
            "/etc/container-webserver/mosquitto:/mosquitto/config:ro"
          ];
        };
      };

      traefik = {
        service = {
          image = "traefik:v2.8";
          container_name = "traefik";
          restart = "always";
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
          restart = "always";
          depends_on = [ "ipv6nat" ];
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
