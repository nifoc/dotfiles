{ nixpkgs, lix-module, home-manager, agenix, disko, neovim-nightly-overlay, nifoc-overlay }:

let
  default-system = "x86_64-linux";

  nixpkgsConfig = {
    overlays = [
      neovim-nightly-overlay.overlays.default
      nifoc-overlay.overlay
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
      {
        nixpkgs = nixpkgsConfig;
        nix = {
          registry.nixpkgs.to = { type = "path"; path = nixpkgs.outPath; };
          nixPath = nixpkgs.lib.mkForce [ "nixpkgs=flake:nixpkgs" ];
        };
      }

      lix-module.nixosModules.default

      disko.nixosModules.disko

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/boron.nix;
        };
      }

      agenix.nixosModules.default

      ../hosts/boron.nix
    ];
  };

  deployment = {
    hostname = "boron";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
