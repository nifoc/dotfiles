{ nixpkgs, disko, home-manager, agenix, attic, inputs, ... }:

let
  default-system = "x86_64-linux";

  # overlay-master = _: _: { pkgs-master = import inputs.nixpkgs-master { system = default-system; }; };

  nixpkgsConfig = {
    overlays = [
      # overlay-master
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nifoc-overlay.overlay
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
      {
        nixpkgs = nixpkgsConfig;
        nix = {
          registry.nixpkgs.to = { type = "path"; path = nixpkgs.outPath; };
          nixPath = nixpkgs.lib.mkForce [ "nixpkgs=flake:nixpkgs" ];
        };
      }

      disko.nixosModules.disko

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/tanker.nix;
        };
      }

      agenix.nixosModules.default

      attic.nixosModules.atticd

      ../hosts/tanker.nix
    ];
  };

  colmena = {
    deployment = {
      targetHost = "tanker";
      targetPort = 22;
      targetUser = "root";
      buildOnTarget = true;

      tags = [ "remote" ];
    };

    nixpkgs.system = default-system;
    imports = system._module.args.modules;
  };
}
