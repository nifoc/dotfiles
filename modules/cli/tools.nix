{
  den.aspects.cli = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          curl
          openrsync
          wget
          wireguard-tools
        ];
      };

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          curl
          openrsync
          wget
          wireguard-tools
        ];
      };

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          arp-scan
          dasel
          dig
          exiftool
          fd
          ffmpeg
          forgejo-cli
          glab
          glow
          hexyl
          hydra-check
          hyperfine
          imagemagick
          immich-cli
          just
          libjxl
          mtr
          nix-tree
          lixPackageSets.latest.nix-update
          lixPackageSets.latest.nurl
          parallel
          q
          ripgrep
          sd
          socat
          ssh-audit
          testssl
          trippy
          viddy
          xxhash
          xz
        ];
      };
  };
}
