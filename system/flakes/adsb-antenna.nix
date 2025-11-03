{
  nixpkgs,
  nixos-hardware,
  home-manager,
  agenix,
  lix-overlay,
  nifoc-overlay,
  run0-sudo-shim,
}:

let
  default-system = "aarch64-linux";

  nixpkgsConfig = {
    overlays = [
      lix-overlay
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

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/adsb-antenna.nix;
        };
      }

      agenix.nixosModules.default

      run0-sudo-shim.nixosModules.default

      ../hosts/adsb-antenna.nix
    ];
  };

  deployment = {
    hostname = "10.0.51.101";
    sshUser = "root";
    remoteBuild = false;
    autoRollback = false;
    magicRollback = false;

    activationTimeout = 600;
  };
}
