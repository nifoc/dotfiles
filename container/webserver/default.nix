let
  config-mosquitto = import ./config/mosquitto.nix;
in
{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      ipv6nat = {
        service = {
          image = "robbertkl/ipv6nat:latest";
          name = "ipv6nat";
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
} // config-mosquitto
