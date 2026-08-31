{ den, ... }:

{
  den.aspects.virtual-machine.provides.amd64-efi = {
    includes = with den.aspects; [
      virtual-machine
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
