{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      jetbrains-mono
      victor-mono
      noto-fonts
      unifont

      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
      })

      montserrat
    ];
  };
}
