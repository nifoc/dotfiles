{
  pkgs ? import <nixpkgs> { },
}:
with pkgs;

mkShell {
  packages = [
    bat
    dasel
    difftastic
    jq
    nix-prefetch-git
    nixpkgs-fmt
  ];
}
