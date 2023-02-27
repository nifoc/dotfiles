{ lib, ... }:

let
  inherit (lib) optionals;

  secret = import ../../secret/hosts/Styx.nix;
in
{
  imports = [
    ../darwin/defaults.nix
    ../darwin/fonts.nix
    ../darwin/sudo.nix
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
        "https://nifoc.cachix.org"
      ] ++ optionals secret.nix-cache.nifoc.enabled [
        secret.nix-cache.nifoc.s3Url
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nifoc.cachix.org-1:ymuftq7RgN/lf/iWXFK8gpwDSAGFaGBeliWe9u6q8II="
      ] ++ optionals secret.nix-cache.nifoc.enabled [
        secret.nix-cache.nifoc.publicKeyValue
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
    ];

    gc = {
      automatic = true;
      user = "daniel";
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
