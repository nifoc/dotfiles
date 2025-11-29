{
  nixpkgs,
  disko,
  home-manager,
  agenix,
  quadlet-nix,
  lix-overlay,
  nifoc-overlay,
  run0-sudo-shim,
}:

let
  default-system = "x86_64-linux";

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
          users.daniel = import ../../home/hosts/krypton.nix;
        };
      }

      agenix.nixosModules.default

      quadlet-nix.nixosModules.quadlet

      run0-sudo-shim.nixosModules.default

      ../hosts/krypton.nix
    ];
  };

  deployment = {
    hostname = "krypton";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
