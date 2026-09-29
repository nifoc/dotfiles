{ den, ... }:

{
  den.aspects.tailscale.provides.peer-relay = {
    nixos =
      { config, ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
      in
      {
        networking.firewall.interfaces = {
          "${networkConfig.default.name}".allowedUDPPorts = [ 40000 ];
          "${networkConfig.tailscale.name}".allowedUDPPorts = [ 40000 ];
        };
      };
  };
}
