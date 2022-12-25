{ pkgs, ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "${pkgs.btop.outPath}/share/btop/themes/dracula.theme";
      theme_background = true;
      truecolor = true;
    };
  };
}
