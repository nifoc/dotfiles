{ den, ... }:

{
  den.aspects.boron = {
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
                interface = [
                  cfg.networking.tailscale.ipv4
                  cfg.networking.tailscale.ipv6
                ];
                kind = "dns";
                freebind = true;
              }
            ];
          };
        };
      };
  };
}
