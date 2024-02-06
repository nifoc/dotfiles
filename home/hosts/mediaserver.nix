{ pkgs, ... }:

{
  imports = [
    ../programs/fish.nix
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

    ../programs/ssh/mediaserver.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      curlHTTP3
      discordchatexporter-cli
      discord-downloader-go
      lnav
      mtr
      parallel
      q
      rexit
      ripgrep
    ];
  };
}
