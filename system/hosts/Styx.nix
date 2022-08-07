{
  imports = [
    ../darwin/defaults.nix
    ../darwin/fonts.nix
  ];

  nix = {
    binaryCaches = [
      "https://nix-community.cachix.org"
      "https://nifoc.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
    ];

    trustedUsers = [
      "@admin"
    ];

    extraOptions = ''
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin
      keep-derivations = true
      keep-outputs = true
      auto-optimise-store = true
    '';

    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "builder-sail";
        systems = [ "x86_64-linux" "aarch64-linux" ];
        maxJobs = 1;
      }
    ];
  };

  users = {
    nix.configureBuildUsers = true;

    users.daniel = {
      home = "/Users/daniel";
    };
  };

  environment = {
    darwinConfig = "$HOME/.config/nixpkgs/system/hosts/Styx.nix";

    variables = {
      EDITOR = "nvim";
    };
  };

  services = {
    nix-daemon.enable = true;
  };
}
