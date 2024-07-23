{ nixpkgs, nixos-hardware, home-manager, inputs, ... }:

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
{
  arch = default-system;

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

  deployment = {
    hostname = "adsb-antenna";
    sshUser = "root";
    remoteBuild = false;
    autoRollback = false;
    magicRollback = false;

    activationTimeout = 600;
  };
}
