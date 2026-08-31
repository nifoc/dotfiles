{
  den.aspects.readeck = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.readeck.settings;
      in
      {
        services.caddy.virtualHosts."readeck.internal.kempkens.network" = {
          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            reverse_proxy ${cfg.server.host}:${toString cfg.server.port}
          '';
        };
      };
  };
}
