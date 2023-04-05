args@{ pkgs, ... }:

let
  secret = import ../../secret/hosts/sail.nix;
in
{
  imports = [
    ../programs/fish.nix
    ../programs/atuin.nix
    ../programs/starship.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/fzf.nix

    ../programs/jq.nix

    ../programs/scripts.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      awscli2
      curlHTTP3
      lnav
      mtr
      parallel
      q
      ripgrep
    ];
  };
}
