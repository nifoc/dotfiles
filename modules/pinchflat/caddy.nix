{
  den.aspects.pinchflat = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.pinchflat;
      in
      {
        services.caddy.virtualHosts."pinchflat.internal.kempkens.network" = {
          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            import tinyauth

            reverse_proxy 10.0.200.100:${toString cfg.port}
          '';
        };
      };
  };
}
