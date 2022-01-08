{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/direnv.nix
    ./config/kitty.nix

    ./programs/nvim

    ./programs/git.nix
    ./programs/lazygit.nix

    ./programs/bat.nix

    ./programs/jq.nix

    ./programs/scripts.nix

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
      podman
      procs
      qemu
      ripgrep
      rtmpdump
      streamlink
      tokei
      wget
      xz
      yt-dlp
    ];

    activation = {
      updateAppCaches = lib.hm.dag.entryAfter [ "onFilesChange" "installPackages" "copyFonts" ] ''
        # nixpkgs
        echo "Calculating new NIX_PATH value ..."
        "$HOME/.bin/calculate-nix-path"

        # neovim
        echo -n "Running LuaCacheClear: "
        nvim -c 'try | execute "LuaCacheClear" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
        printf '\nRemoving luacache file: '
        rm -f "$HOME/.cache/nvim/luacache"
        echo "Done"
        echo 'Running TSUpdateSync ...'
        nvim -c 'try | execute "TSUpdateSync" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
        printf '\n'
      '';

      reportChanges = lib.hm.dag.entryAfter [ "updateAppCaches" ] ''
        nix store diff-closures $oldGenPath $newGenPath
      '';
    };
  };

  programs = {
    home-manager.enable = true;

    zoxide.enable = true;
  };
}
