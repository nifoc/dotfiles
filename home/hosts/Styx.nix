{ pkgs, lib, config, ... }:

{
  imports = [
    ../config/fonts

    ../programs/fish.nix
    ../programs/nushell.nix
    ../programs/atuin.nix
    ../programs/direnv.nix
    ../programs/fzf.nix
    ../programs/starship.nix
    ../programs/zoxide.nix

    ../programs/wezterm.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    ../programs/btop.nix

    ../programs/gallery-dl.nix

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

  disabledModules = [ "targets/darwin/linkapps.nix" ];

  home = {
    stateVersion = "22.11";

    packages = with pkgs; [
      agilebits-op
      arp-scan
      curlHTTP3
      dasel
      dig
      eternal-terminal
      exiftool
      fd
      ffmpeg
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
      viddy
      wget
      xxHash
      xz
    ];

    activation.aliasApplications = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };

        lastAppsFile = "${config.xdg.stateHome}/nix/.apps";
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] /* bash */ ''
        last_apps=$(cat "${lastAppsFile}" 2>/dev/null || echo "")
        next_apps=$(readlink -f ${apps}/Applications/* | sort)

        if [ "$last_apps" != "$next_apps" ]; then
          echo "Apps have changed. Updating macOS aliases..."

          apps_path="$HOME/Applications/Home Manager Apps"
          $DRY_RUN_CMD mkdir -p "$apps_path"

          $DRY_RUN_CMD ${lib.getExe pkgs.fd} \
            -t l -d 1 . ${apps}/Applications \
            -x $DRY_RUN_CMD "${pkgs.mkalias}/bin/mkalias" \
            -L {} "$apps_path/{/}"

          [ -z "$DRY_RUN_CMD" ] && echo "$next_apps" > "${lastAppsFile}"
        fi
      ''
    );
  };
}
