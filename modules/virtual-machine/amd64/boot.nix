{ den, ... }:

{
  den.aspects.virtual-machine.provides.amd64 = {
    includes = with den.aspects; [
      virtual-machine
    ];

    nixos =
      { lib, ... }:
      {
        boot = {
          loader = {
            grub.devices = lib.mkDefault [ "/dev/sda" ];
            efi.canTouchEfiVariables = true;
          };
        };
      };
  };
}
