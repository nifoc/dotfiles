{ den, ... }:

{
  den.aspects.tailscale.provides.exit-node = {
    includes = with den.aspects; [
      tailscale._.router
    ];

    nixos = {
      services.tailscale = {
        extraUpFlags = [
          "--advertise-exit-node"
        ];
      };
    };
  };
}
