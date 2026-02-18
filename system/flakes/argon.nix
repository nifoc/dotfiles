{
  nixpkgs,
  disko,
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

      disko.nixosModules.disko

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/argon.nix;
        };
      }

      agenix.nixosModules.default

      run0-sudo-shim.nixosModules.default

      ../hosts/argon.nix
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
