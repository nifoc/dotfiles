{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    unifont

    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
}
