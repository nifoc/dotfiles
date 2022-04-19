{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "VictorMono"
        ];
      })
    ];
  };
}
