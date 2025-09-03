{
  pkgs,
  lib,
  config,
  ...
}:

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

    ../programs/jetbrains.nix

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

    activation.linkApps = lib.hm.dag.entryAfter [ "installPackages" ] (
      let
        applications = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      ''
        ourLink () {
          local link
          link=$(readlink "$1")
          [ -L "$1" ] && [ "''${link#*-}" = 'home-manager-applications/Applications' ]
        }

        targetFolder="$HOME/Applications/Home Manager Apps"

        echo "setting up $targetFolder ..." >&2

        if [ -e "$targetFolder" ] && ourLink "$targetFolder"; then
          $DRY_RUN_CMD rm "$targetFolder"
        fi

        $DRY_RUN_CMD mkdir -p "$targetFolder"

        rsyncFlags=(
          --archive
          --checksum
          --copy-unsafe-links
          --delete
          --exclude=$'Icon\r'
          --no-group
          --no-owner
        )

        $DRY_RUN_CMD ${lib.getExe pkgs.rsync} "''${rsyncFlags[@]}" ${applications}/Applications/ "$targetFolder"
      ''
    );
  };

  targets.darwin.linkApps.enable = false;
}
