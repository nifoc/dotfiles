{ den, ... }:

{
  den.aspects.virtual-machine.provides.arm64 = {
    includes = with den.aspects; [
      virtual-machine
    ];

    nixos = {
      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

        kernelParams = [ "console=tty" ];
      };
    };
  };
}
