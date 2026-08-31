{
  den.aspects.xenon.nixos =
    { lib, ... }:
    {
      services.zfs = {
        autoSnapshot = {
          daily = lib.mkForce 7;
        };

        autoScrub = {
          interval = lib.mkForce "quarterly";
        };
      };
    };
}
