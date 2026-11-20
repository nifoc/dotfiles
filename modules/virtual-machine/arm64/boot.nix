{ den, ... }:

{
  den.aspects.virtual-machine.provides.arm64 = {
    includes = with den.aspects; [
      virtual-machine
    ];

    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
      in
      {
        boot = {
          loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
          };

          inherit (cfg.boot) kernelParams;
        };
      };
  };
}
