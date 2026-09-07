{ den, ... }:

{
  den.aspects.neon = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
      in
      {
        services.blocky = {
          settings = {
            ports.dns = [
              "${cfg.networking.default.ipv4}:53"
              "${cfg.networking.iot.ipv4}:53"
              "${cfg.networking.dtag.ipv4}:53"
              "${cfg.networking.tailscale.ipv4}:53"
              "[${cfg.networking.tailscale.ipv6}]:53"
            ];
          };
        };
      };
  };
}
