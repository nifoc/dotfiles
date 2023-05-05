{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      jetbrains-mono
      noto-fonts
      unifont

      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };
}
