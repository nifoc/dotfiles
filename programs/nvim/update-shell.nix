{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  packages = [
    bat
    curl
    jq
    nix-prefetch-github
    nixpkgs-fmt
  ];
}
