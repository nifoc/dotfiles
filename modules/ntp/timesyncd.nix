{
  den.aspects.ntp = {
    nixos =
      { lib, ... }:
      {
        services.timesyncd.enable = lib.mkForce false;
      };
  };
}
