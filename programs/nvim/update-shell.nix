{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  packages = [
    bat
    curl
    dasel
    difftastic
    jq
    nix-prefetch
    nixpkgs-fmt
  ];
}
