{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/starship.nix
    ./config/kitty.nix

    ./programs/nvim

    ./programs/git.nix
    ./programs/lazygit.nix

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
      updateAppCaches = lib.hm.dag.entryAfter [ "onFilesChange" "installPackages" "copyFonts" ] ''
        # nixpkgs
        echo "Calculating new NIX_PATH value ..."
        mkdir -p "$HOME/.cache/fish"
        nix flake metadata ~/.config/nixpkgs --json 2>/dev/null | \
          jq -r '.locks.nodes.nixpkgs.locked | "\(.type):\(.owner)/\(.repo)/\(.rev)"' | \
          xargs -I {} nix flake metadata {} --json | \
          jq -r '. | "nixpkgs=\(.path)"' >"$HOME/.cache/fish/nix_path_value"

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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zoxide.enable = true;
  };
}
