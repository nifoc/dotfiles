{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  packages = [
    bat
    curl
    dasel
    difftastic
    jq
    nix-prefetch-github
    nixpkgs-fmt
  ];
}
