{ nixpkgs, disko, home-manager, agenix, attic, inputs, ... }:

let
  default-system = "x86_64-linux";

  # overlay-master = _: _: { pkgs-master = import inputs.nixpkgs-master { system = default-system; }; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
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

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/tanker.nix;
        };
      }
    ];
  };

  colmena = {
    deployment = {
      targetHost = "tanker";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = true;
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
