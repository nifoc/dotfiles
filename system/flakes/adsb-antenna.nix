{ nixpkgs, deploy-rs, home-manager, inputs, ... }:

let
  default-system = "aarch64-linux";

  overlay-attic = inputs.attic.overlays.default;
  overlay-deploy-rs = _: _: { inherit (inputs.deploy-rs.packages.${default-system}) deploy-rs; };
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
    };
  };
in
rec {
  system = nixpkgs.lib.nixosSystem {
    system = default-system;
    modules = [
      ../hosts/adsb-antenna.nix

      home-manager.nixosModules.home-manager

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/adsb-antenna.nix;
      }
    ];
  };

  deployment = {
    hostname = "adsb-antenna";
    sshUser = "root";
    remoteBuild = true;

    profiles.system = {
      path = deploy-rs.lib.${default-system}.activate.nixos system;
    };
  };
}
