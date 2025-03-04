{ pkgs, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/atuin.nix
    ../programs/starship.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/jq.nix

    ../programs/scripts.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      curl
      lnav
      mtr
      parallel
      q
      ripgrep
    ];
  };
}
