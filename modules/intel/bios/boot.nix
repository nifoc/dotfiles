{ den, ... }:

{
  den.aspects.intel.provides.bios = {
    includes = with den.aspects; [
      intel
    ];

    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta.boot;
      in
      {
        boot = {
          loader = {
            grub = {
              mirroredBoots = lib.mkForce cfg.mirroredBoots;

              efiSupport = true;
              efiInstallAsRemovable = true;

              gfxmodeBios = "1024x768";
              gfxpayloadBios = "keep";
            };
          };
        };

        environment.variables = {
          SYSTEMD_RELAX_ESP_CHECKS = "1";
        };
      };
  };
}
