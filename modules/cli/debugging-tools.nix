{
  den.aspects.cli = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          ethtool
          ldns
          lm_sensors
          openseachest
          pciutils
          smartmontools
          tcpdump
          trippy
        ];
      };
  };
}
