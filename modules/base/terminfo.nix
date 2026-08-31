{
  den.aspects.base = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ wezterm.terminfo ];
      };
  };
}
