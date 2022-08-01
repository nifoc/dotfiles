{ pkgs, ... }:

{
  imports = [
    ../programs/fish.nix
    ../programs/starship.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/fzf.nix

    ../programs/jq.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      ripgrep
    ];
  };
}
