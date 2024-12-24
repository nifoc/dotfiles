{ pkgs, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/starship.nix

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/jq.nix

    ../programs/scripts.nix
  ];

  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      ripgrep
    ];
  };
}
