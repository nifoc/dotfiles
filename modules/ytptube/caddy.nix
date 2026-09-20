{
  den.aspects.ytptube = {
    nixos =
      { config, ... }:
      let
        cfg = config.virtualisation.quadlet.containers.ytptube.containerConfig.environments;
      in
      {
        services.caddy.virtualHosts."ytptube.internal.kempkens.network" = {
          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            reverse_proxy ${cfg.YTP_HOST}:${cfg.YTP_PORT}
          '';
        };
      };
  };
}
