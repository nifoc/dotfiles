{ pkgs, ... }:

{
  imports = [
    ../config/macos.nix
    ../config/fonts

    ../programs/zsh
    ../programs/atuin.nix
    ../programs/fzf.nix
    ../programs/starship.nix
    ../programs/zoxide.nix

    ../programs/amethyst.nix
    ../programs/wezterm.nix

    ../programs/nvim

    ../programs/git.nix
    ../programs/lazygit.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/gpg.nix

    ../programs/hammerspoon.nix

    ../programs/iex.nix

    ../programs/jq.nix

    ../programs/firefox.nix

    ../programs/podman.nix

    ../programs/scripts.nix

    ../programs/ssh/Styx.nix
    ../programs/eternal-terminal.nix

    ../programs/texlive.nix
    ../programs/pandoc.nix

    ../programs/yt-dlp.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      _1password-cli
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
      just
      lnav
      mtr
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
