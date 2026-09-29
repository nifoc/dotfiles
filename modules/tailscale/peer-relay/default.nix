{ den, ... }:

{
  den.aspects.tailscale.provides.peer-relay = {
    includes = with den.aspects; [
      tailscale
    ];

    nixos = {
      services.tailscale = {
        extraUpFlags = [
          "--relay-server-port=40000"
        ];
      };
    };
  };
}
