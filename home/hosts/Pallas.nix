{ pkgs, ... }:

{
  imports = [
    ../config/macos.nix
    ../config/fonts

    ../programs/zsh
    ../programs/atuin.nix
    ../programs/direnv.nix
    ../programs/fzf.nix
    ../programs/starship.nix
    ../programs/zoxide.nix

    ../programs/amethyst.nix
    ../programs/rift.nix
    ../programs/wezterm.nix

    ../programs/nvim

    ../programs/git.nix
    ../programs/lazygit.nix

    ../programs/bat.nix

    ../programs/bitwarden.nix

    ../programs/btop.nix

    ../programs/gallery-dl.nix

    ../programs/gpg.nix

    ../programs/hammerspoon.nix

    ../programs/iex.nix

    ../programs/jq.nix

    ../programs/scripts.nix

    ../programs/ssh/Pallas.nix
    ../programs/eternal-terminal.nix

    ../programs/yazi.nix

    ../programs/yt-dlp.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      arp-scan
      curl
      dasel
      dig
      exiftool
      fd
      ffmpeg
      forgejo-cli
      glab
      glow
      hexyl
      hyperfine
      imagemagick
      immich-cli
      just
      libjxl
      mtr
      nix-forecast
      nix-tree
      nix-update
      nurl
      parallel
      q
      ripgrep
      socat
      ssh-audit
      testssl
      trippy
      viddy
      wget
      xxHash
      xz
    ];
  };

  targets.darwin.linkApps.enable = false;
  targets.darwin.copyApps.enable = true;
}
