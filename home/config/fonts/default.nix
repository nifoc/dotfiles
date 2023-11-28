{ pkgs, ... }:

let
  berkeley-mono = pkgs.stdenvNoCC.mkDerivation rec {
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

  nerdfonts = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "nerdfonts";
    version = "3.1.1";

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
  ];
}
