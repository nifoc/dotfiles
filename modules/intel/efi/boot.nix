{ den, ... }:

{
  den.aspects.intel.provides.efi = {
    includes = with den.aspects; [
      intel
    ];

    nixos = {
      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
      };
    };
  };
}
