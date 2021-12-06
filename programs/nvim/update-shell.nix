{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    bat
    nix-prefetch-github
    nixpkgs-fmt
  ];
}
