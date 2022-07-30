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
}
