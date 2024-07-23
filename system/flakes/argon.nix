{ nixpkgs, nixos-hardware, home-manager, agenix, inputs, ... }:

let
  default-system = "aarch64-linux";

  nixpkgsConfig = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nifoc-overlay.overlay
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;

      permittedInsecurePackages = [ ];
    };
  };
in
{
  arch = default-system;

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

  deployment = {
    hostname = "argon";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
