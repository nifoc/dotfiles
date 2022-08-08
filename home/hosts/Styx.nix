{ pkgs, ... }:

{
  imports = [
    ../programs/fish.nix
    ../programs/starship.nix
    ../programs/direnv.nix
    ../programs/kitty.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/fzf.nix

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
      agilebits-op
      aria2
      arp-scan
      cachix
      curlFull
      dasel
      exa
      fd
      ffmpeg
      gallery-dl
      glow
      hexyl
      hyperfine
      lnav
      mtr
      nix-prefetch
      parallel
      q
      ripgrep
      socat
      tokei
      viddy
      wget
      xz
    ];
  };

  programs = {
    zoxide.enable = true;
  };
}
