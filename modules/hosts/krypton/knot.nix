{ den, ... }:

{
  den.aspects.krypton = {
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
                interface = [ "10.0.0.100" ];
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
