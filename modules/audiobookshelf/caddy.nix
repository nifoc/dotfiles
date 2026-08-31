{
  den.aspects.audiobookshelf = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.audiobookshelf;
      in
      {
        services.caddy.virtualHosts = {
          "audiobookshelf.internal.kempkens.network" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy ${cfg.host}:${toString cfg.port} {
                flush_interval -1
              }
            '';
          };
        };
      };
  };
}
