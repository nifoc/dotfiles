{ nixpkgs, nixos-hardware, home-manager, agenix, inputs, ... }:

let
  default-system = "aarch64-linux";

  overlay-attic = inputs.attic.overlays.default;
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-attic
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
      ../hosts/argon.nix

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
          users.daniel = import ../../home/hosts/argon.nix;
        };
      }
    ];
  };

  colmena = {
    deployment = {
      targetHost = "argon";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = true;
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
