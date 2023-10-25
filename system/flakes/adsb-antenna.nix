{ nixpkgs, nixos-hardware, home-manager, inputs, ... }:

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
      ../hosts/adsb-antenna.nix

      nixos-hardware.nixosModules.raspberry-pi-4

      home-manager.nixosModules.home-manager

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/adsb-antenna.nix;
        };
      }
    ];
  };

  colmena = {
    deployment = {
      targetHost = "adsb-antenna";
      targetPort = 22;
      targetUser = "root";
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
