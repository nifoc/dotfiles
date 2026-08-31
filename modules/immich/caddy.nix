{
  den.aspects.immich = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.immich;
      in
      {
        services.caddy.virtualHosts = {
          "immich.internal.kempkens.network" = {

            extraConfig = ''
              encode

              request_body {
                max_size 1GB 
              }

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
