{
  den.aspects.krypton.nixos =
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
