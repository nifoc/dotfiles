{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/direnv.nix
    ./programs/kitty.nix

    ./programs/nvim

    ./programs/git.nix
    ./programs/lazygit.nix

    ./programs/bat.nix

    ./programs/jq.nix

    ./programs/scripts.nix

    ./config/ssh.nix

    ./config/yt-dlp.nix
  ];

  home = {
    stateVersion = "22.05";

    packages = with pkgs; [
      aria2
      arp-scan
      atomicparsley
      cachix
      cliclick
      curlFull
      dogdns
      exa
      fd
      ffmpeg
      fzf
      gallery-dl
      glow
      gvproxy
      hexyl
      hyperfine
      lnav
      nix-prefetch-github
      nvd
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

    sessionVariables = {
      TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
    };

    activation = {
      updateAppCaches = lib.hm.dag.entryAfter [ "onFilesChange" "installPackages" "copyFonts" ] ''
        # neovim
        echo -n 'Removing luacache file: '
        rm -f "$HOME/.cache/nvim/luacache"
        echo 'Done'

        nvim_bin="/etc/profiles/per-user/$USER/bin/nvim"
        if [ -e "$nvim_bin" ]; then
          echo -n 'Running LuaCacheClear: '
          $nvim_bin -c 'try | execute "LuaCacheClear" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
          printf '\nRunning TSUpdateSync ... '
          $nvim_bin -c 'try | execute "TSUpdateSync" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
          printf '\n'
        fi
      '';
    };
  };

  programs = {
    zoxide.enable = true;
  };
}
