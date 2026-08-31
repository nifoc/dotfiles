{
  den.aspects.remote-access = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.wezterm.headless ];
      };
  };
}
