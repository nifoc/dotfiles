{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    bat
    curl
    jq
    nix-prefetch-github
    nixpkgs-fmt
  ];
}
