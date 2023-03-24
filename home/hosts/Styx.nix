args@{ pkgs, config, lib, ... }:

{
  imports = [
    ../programs/fish.nix
    ../programs/atuin.nix
    ../programs/starship.nix
    ../programs/direnv.nix
    ../programs/wezterm.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/fzf.nix

    ../programs/gpg.nix

    ../programs/jq.nix

    ../programs/texlive.nix
    ../programs/pandoc.nix

    ../programs/podman.nix

    ../programs/scripts.nix

    ../programs/ssh/Styx.nix

    ../programs/streamlink.nix
    ../programs/yt-dlp.nix
  ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      agenix
      agilebits-op
      aria2
      arp-scan
      awscli2
      curlFull
      dasel
      exa
      exiftool
      fd
      ffmpeg
      gallery-dl
      glow
      hexyl
      hyperfine
      lnav
      mtr
      nurl
      parallel
      q
      ripgrep
      socat
      tokei
      viddy
      wget
      xxHash
      xz
    ];
  };

  programs = {
    zoxide.enable = true;
  };
}
