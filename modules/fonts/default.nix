{
  den.aspects.fonts = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          jetbrains-mono
          noto-fonts
        ];
      };
  };
}
