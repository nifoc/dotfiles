{ nixpkgs, lix-module, home-manager, agenix, disko, nifoc-overlay }:

let
  default-system = "aarch64-linux";

  nixpkgsConfig = {
    overlays = [
      nifoc-overlay.overlay
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;

      permittedInsecurePackages = [ "olm-3.2.16" ];
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
          users.daniel = import ../../home/hosts/carbon.nix;
        };
      }

      agenix.nixosModules.default

      ../hosts/carbon.nix
    ];
  };

  deployment = {
    hostname = "carbon";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
