{ nixpkgs, deploy-rs, home-manager, agenix, inputs, ... }:

let
  default-system = "x86_64-linux";

  overlay-attic = inputs.attic.overlays.default;
  overlay-deploy-rs = _: _: { inherit (deploy-rs.packages.${default-system}) deploy-rs; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-attic
      overlay-deploy-rs
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
      ../hosts/sail.nix

      home-manager.nixosModules.home-manager

      agenix.nixosModules.default

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/sail.nix;
      }
    ];
  };

  deployment = {
    hostname = "sail";
    sshUser = "root";
    remoteBuild = true;

    profiles.system = {
      path = deploy-rs.lib.${default-system}.activate.nixos system;
    };
  };
}
