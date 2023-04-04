{
  imports = [
    ../darwin/defaults.nix
    ../darwin/fonts.nix
    ../darwin/sudo.nix
    ../darwin/fish.nix
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
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "wurzelpfropf.cachix.org-1:ilZwK5a6wJqVr7Fyrzp4blIEkGK+LJT0QrpWr1qBNq0="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
      ];

      trusted-users = [ "@admin" ];
    };

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
  };

  services = {
    nix-daemon.enable = true;
  };
}
