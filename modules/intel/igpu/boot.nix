{
  den.aspects.intel.provides.igpu = {
    nixos =
      { pkgs, ... }:
      {
        hardware = {
          graphics = {
            enable = true;
            extraPackages = with pkgs; [
              intel-media-driver
              vpl-gpu-rt
              intel-compute-runtime
            ];
          };
        };

        boot = {
          kernelParams = [ "i915.enable_guc=3" ];
        };

        environment = {
          variables = {
            LIBVA_DRIVER_NAME = "iHD";
          };

          systemPackages = with pkgs; [
            intel-gpu-tools
          ];
        };
      };
  };
}
