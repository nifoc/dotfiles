{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  packages = [
    bat
    curl
    dasel
    jq
    nix-prefetch-github
    nixpkgs-fmt
  ];
}
