{ nixpkgs, home-manager, agenix, inputs, ... }:

let
  default-system = "x86_64-linux";

  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
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
      ../hosts/mediaserver.nix

      home-manager.nixosModules.home-manager

      agenix.nixosModules.default

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/mediaserver.nix;
        };
      }
    ];
  };

  colmena = {
    deployment = {
      targetHost = "mediaserver";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = true;

      tags = [ "home" ];
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
