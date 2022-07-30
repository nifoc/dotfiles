{
  virtualisation.arion.projects.webserver.settings = {
    services = {
      ifconfig-sexy = {
        service = {
          image = "ghcr.io/nifoc/ifconfig.sexy-caddy:master";
          restart = "always";
        };
      };
    };
  };
}
