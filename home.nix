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
      cliclick
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
      cleanAppCaches = lib.hm.dag.entryAfter [ "onFilesChange" "installPackages" "copyFonts" ] ''
        echo -n "Running LuaCacheClear: "
        nvim -c 'try | execute "LuaCacheClear" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
        printf '\nRemoving luacache file: '
        rm -f "$HOME/.cache/nvim/luacache"
        echo "Done"
      '';

      reportChanges = lib.hm.dag.entryAfter [ "onFilesChange" "installPackages" "copyFonts" ] ''
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
