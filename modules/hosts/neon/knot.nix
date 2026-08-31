{ den, ... }:

{
  den.aspects.neon = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
      in
      {
        services.knot-resolver = {
          settings = {
            workers = 2;

            network.listen = [
              {
                interface = [ "10.0.0.7" ];
                kind = "dns";
                freebind = false;
              }

              {
                interface = [ "10.0.51.7" ];
                kind = "dns";
                freebind = false;
              }

              {
                interface = [ "10.0.200.7" ];
                kind = "dns";
                freebind = false;
              }

              {
                interface = [ cfg.networking.tailscale.ipv4 ];
                kind = "dns";
                freebind = true;
              }
            ];
          };
        };
      };
  };
}
