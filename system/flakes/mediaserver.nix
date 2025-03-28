{ nixpkgs, lix-module, home-manager, agenix, inputs, ... }:

let
  default-system = "x86_64-linux";

  nixpkgsConfig = {
    overlays = [
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
      {
        nixpkgs = nixpkgsConfig;
        nix = {
          registry.nixpkgs.to = { type = "path"; path = nixpkgs.outPath; };
          nixPath = nixpkgs.lib.mkForce [ "nixpkgs=flake:nixpkgs" ];
        };
      }

      lix-module.nixosModules.default

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/mediaserver.nix;
        };
      }

      agenix.nixosModules.default

      ../hosts/mediaserver.nix
    ];
  };

  deployment = {
    hostname = "mediaserver";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
