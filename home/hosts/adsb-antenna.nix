args@{ pkgs, ... }:

let
  secret = import ../../secret/hosts/adsb-antenna.nix;
in
{
  imports = [
    ../programs/fish.nix
    ../programs/starship.nix

    ../programs/git.nix

    ../programs/bat.nix

    (import ../programs/custom-nix-cache.nix (args // { inherit secret; }))

    ../programs/fzf.nix

    ../programs/jq.nix

    ../programs/scripts.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      ripgrep
    ];
  };
}
