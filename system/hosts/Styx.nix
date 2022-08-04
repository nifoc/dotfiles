{
  imports = [
    ../darwin/defaults.nix
    ../darwin/fonts.nix
  ];

  nix = {
    binaryCaches = [
      "https://nix-community.cachix.org"
    ];

    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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

    buildMachines = [
      {
        hostName = "builder-sail";
        system = "x86_64-linux";
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
