{ pkgs, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/fzf.nix
    ../programs/starship.nix
    ../programs/zoxide.nix

    ../programs/git.nix

    ../programs/bat.nix

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
