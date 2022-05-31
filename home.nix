{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/direnv.nix
    ./programs/kitty.nix

    ./programs/nvim

    ./programs/git.nix

    ./programs/bat.nix

    ./programs/jq.nix

    ./programs/scripts.nix

    ./programs/ssh.nix

    ./programs/yt-dlp.nix
  ];

  home = {
    stateVersion = "22.05";

    packages = with pkgs; [
      agilebits-op
      aria2
      arp-scan
      atomicparsley
      cachix
      cliclick
      curlFull
      dasel
      dogdns
      exa
      fd
      ffmpeg
      fzf
      gallery-dl
      glow
      hexyl
      hyperfine
      lnav
      nix-prefetch
      nvd
      parallel
      podman
      qemu
      ripgrep
      rtmpdump
      streamlink
      socat
      tokei
      wget
      xz
    ];

    activation = {
      updateAppCaches = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # neovim
        echo -n '[nvim] Removing luacache file: '
        $DRY_RUN_CMD rm -f $HOME/.cache/nvim/luacache*
        echo 'Done'
      '';

      updateRuntimeDependencies = lib.hm.dag.entryAfter [ "updateAppCaches" ] ''
        # neovim
        nvim_bin="$newGenPath/home-path/bin/nvim"
        if [ -e "$nvim_bin" ]; then
          echo -n '[nvim] Running TSUpdateSync ... '
          $DRY_RUN_CMD $nvim_bin -c 'try | execute "TSUpdateSync" | echo "Done" | catch /.*/ | echo "Command not found" | endtry | q' --headless
          printf '\n'
        fi
      '';
    };
  };

  programs = {
    zoxide.enable = true;
  };
}
