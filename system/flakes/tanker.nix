{ nixpkgs, nixos-stable, disko, deploy-rs, home-manager, agenix, attic, inputs, ... }:

let
  default-system = "x86_64-linux";

  overlay-stable = _: _: { pkgs-stable = import nixos-stable { system = default-system; }; };
  # overlay-master = _: _: { pkgs-master = import inputs.nixpkgs-master { system = default-system; }; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-stable
      # overlay-master
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
      disko.nixosModules.disko

      ../hosts/tanker.nix

      home-manager.nixosModules.home-manager

      agenix.nixosModules.default

      attic.nixosModules.atticd

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/tanker.nix;
      }
    ];
  };

  deployment = {
    hostname = "tanker";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;

    profiles.system = {
      path = deploy-rs.lib.${default-system}.activate.nixos system;
    };
  };
}
