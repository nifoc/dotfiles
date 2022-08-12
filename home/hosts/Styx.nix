args@{ pkgs, config, lib, ... }:

let
  secret = import ../../secret/hosts/Styx.nix;
in
{
  imports = [
    ../programs/fish.nix
    ../programs/starship.nix
    ../programs/direnv.nix
    ../programs/kitty.nix

    ../programs/nvim

    ../programs/git.nix

    ../programs/bat.nix

    (import ../programs/custom-nix-cache.nix (args // { inherit secret; }))

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
      xxHash
      xz
    ];
  };

  programs = {
    zoxide.enable = true;
  };

  # Source: https://github.com/nix-community/home-manager/issues/1341#issuecomment-1190875080
  home.activation.copyApplications =
    let
      apps = pkgs.buildEnv {
        name = "home-manager-applications";
        paths = config.home.packages;
        pathsToLink = "/Applications";
      };
    in
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      baseDir="$HOME/Applications/Home Manager Apps"
      $DRY_RUN_CMD mkdir -p "$baseDir"

      for appFile in ${apps}/Applications/*; do
        appFileChecksum="$(find "$appFile/Contents/MacOS" -type f -exec md5 -q {} \; | md5 -q)"
        target="$baseDir/$(basename "$appFile")"

        if [ -d "$target" ]; then
          targetChecksum="$(find "$target/Contents/MacOS" -type f -exec md5 -q {} \; | md5 -q)"
        else 
          targetChecksum="0"
        fi

        if [ "$appFileChecksum" = "$targetChecksum" ]; then
          echo "Application not changed: $(basename "$appFile")"
        else
          echo -n "Coyping application $(basename "$appFile"): "
          $DRY_RUN_CMD rm -rf "$target"
          $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
          $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
          echo 'Done'
        fi
      done
    '';
}
