{ pkgs, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/atuin.nix
    ../programs/starship.nix
    ../programs/direnv.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/gallery-dl.nix

    ../programs/jq.nix

    ../programs/scripts.nix

    ../programs/ssh/krypton.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      curl
      discordchatexporter-cli
      instaloader
      lnav
      mtr
      parallel
      q
      ripgrep
    ];
  };
}
