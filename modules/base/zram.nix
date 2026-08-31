{ den, ... }:

{
  den.aspects.base = {
    nixos =
      { config, ... }:
      let
        zramConfig = (den.aspects.${config.networking.hostName}.meta.zram or { });
        memoryPercent = (zramConfig.memoryPercent or 30);
        writebackDevice = (zramConfig.writebackDevice or null);
      in
      {
        zramSwap = {
          enable = (memoryPercent > 0);
          algorithm = "zstd";
          inherit memoryPercent writebackDevice;
        };
      };
  };
}
