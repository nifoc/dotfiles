{
  imports = [
    ../darwin/defaults.nix
    ../darwin/fonts.nix
    ../darwin/sudo.nix
    ../darwin/fish.nix
    ../darwin/attic.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" ];

      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://wurzelpfropf.cachix.org"
        "https://nifoc.cachix.org"
        "https://attic.cache.daniel.sx/nifoc-systems"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "wurzelpfropf.cachix.org-1:ilZwK5a6wJqVr7Fyrzp4blIEkGK+LJT0QrpWr1qBNq0="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
        "nifoc-systems:eDDqVP5BFR6/1KvXbF9oUL8JahDdmbrsYtxlQ57LOTU="
      ];

      trusted-users = [ "@admin" ];
    };

    extraOptions = ''
      post-build-hook = ${../../home/programs/scripts/attic-system-cache}
    '';

    configureBuildUsers = true;

    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "builder-sail";
        systems = [ "x86_64-linux" "aarch64-linux" ];
        maxJobs = 1;
      }

      {
        hostName = "builder-attic";
        systems = [ "x86_64-linux" "aarch64-linux" ];
        maxJobs = 1;
      }
    ];

    gc = {
      automatic = true;
      user = "daniel";
      interval = { Weekday = 0; Hour = 3; Minute = 15; };
    };
  };

  documentation.doc.enable = false;

  users = {
    users.daniel = {
      home = "/Users/daniel";
    };
  };

  environment = {
    darwinConfig = "$HOME/.config/nixpkgs/system/hosts/Styx.nix";
    etc."nix/netrc".source = ../../secret/shared/nix-netrc;
  };

  services = {
    nix-daemon.enable = true;
  };
}
