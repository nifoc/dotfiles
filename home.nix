{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/starship.nix
    ./config/kitty.nix

    ./programs/nvim

    ./programs/git.nix

    ./programs/bat.nix

    ./programs/jq.nix

    ./config/yt-dlp.nix
  ];

  home = {
    packages = with pkgs; [
      aria2
      arp-scan
      atomicparsley
      cachix
      dogdns
      exa
      fd
      ffmpeg
      fzf
      gallery-dl
      hexyl
      hyperfine
      nix-prefetch-github
      parallel
      procs
      ripgrep
      rtmpdump
      tokei
      wget
      yt-dlp
    ];

    activation = {
      reportChanges = lib.hm.dag.entryAnywhere ''
        nix store diff-closures $oldGenPath $newGenPath
      '';
    };
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zoxide.enable = true;
  };
}
