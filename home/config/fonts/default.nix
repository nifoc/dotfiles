{ pkgs, ... }:

let
  berkeley-mono = pkgs.stdenvNoCC.mkDerivation {
    pname = "berkeley-mono";
    version = "1.009";

    src = ../../../secret/fonts/BerkeleyMono;

    dontPatch = true;
    dontConfigure = true;
    dontBuild = true;
    doCheck = false;
    dontFixup = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 -t $out/share/fonts/opentype/ *.otf
      runHook postInstall
    '';
  };

  tx-02 = pkgs.stdenvNoCC.mkDerivation {
    pname = "tx-02";
    version = "2.002";

    src = ../../../secret/fonts/TX-02;

    dontPatch = true;
    dontConfigure = true;
    dontBuild = true;
    doCheck = false;
    dontFixup = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 -t $out/share/fonts/opentype/ *.otf
      runHook postInstall
    '';
  };

  nerdfonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "nerdfonts";
    version = "3.3.0";

    src = ./NerdFonts;

    dontPatch = true;
    dontConfigure = true;
    dontBuild = true;
    doCheck = false;
    dontFixup = true;

    installPhase = ''
      runHook preInstall
      install -Dm644 -t $out/share/fonts/truetype/ *.ttf
      runHook postInstall
    '';
  };
in
{
  home.packages = with pkgs; [
    berkeley-mono
    jetbrains-mono
    nerdfonts
    noto-fonts
    tx-02
  ];
}
