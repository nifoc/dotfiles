{ nixpkgs, nixos-hardware, home-manager, agenix, inputs, ... }:

let
  default-system = "aarch64-linux";

  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-nifoc
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;

      permittedInsecurePackages = [
        "openssl-1.1.1t"
      ];
    };
  };
in
rec {
  system = nixpkgs.lib.nixosSystem {
    system = default-system;
    modules = [
      ../hosts/neon.nix

      nixos-hardware.nixosModules.raspberry-pi-4

      home-manager.nixosModules.home-manager

      agenix.nixosModules.default

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/neon.nix;
        };
      }
    ];
  };

  colmena = {
    deployment = {
      targetHost = "neon";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = true;

      tags = [ "home" "rpi4" ];
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
