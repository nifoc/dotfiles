{ den, ... }:

{
  den.aspects.krypton = {
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
              "${cfg.networking.tailscale.ipv4}:53"
              "[${cfg.networking.tailscale.ipv6}]:53"
            ];
          };
        };
      };
  };
}
