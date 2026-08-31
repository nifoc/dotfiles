{
  den.aspects.raspberrypi = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          libraspberrypi
        ];
      };
  };
}
