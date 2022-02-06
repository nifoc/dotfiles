{ pkgs, ... }:

{
  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
