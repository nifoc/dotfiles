{
  nixpkgs,
  lix-module,
  nixos-hardware,
  home-manager,
  agenix,
  nifoc-overlay,
  run0-sudo-shim,
}:

let
  default-system = "aarch64-linux";

  nixpkgsConfig = {
    overlays = [
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
          registry.nixpkgs.to = {
            type = "path";
            path = nixpkgs.outPath;
          };
          nixPath = nixpkgs.lib.mkForce [ "nixpkgs=flake:nixpkgs" ];
        };
      }

      nixos-hardware.nixosModules.raspberry-pi-4

      lix-module.nixosModules.default

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/neon.nix;
        };
      }

      agenix.nixosModules.default

      run0-sudo-shim.nixosModules.default

      ../hosts/neon.nix
    ];
  };

  deployment = {
    hostname = "neon";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
