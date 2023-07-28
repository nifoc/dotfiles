{ nixpkgs, home-manager, nix-darwin, inputs, ... }:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };
  overlay-agenix = inputs.agenix.overlays.default;
  overlay-attic = inputs.attic.overlays.default;
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-x86
      overlay-agenix
      overlay-attic
      overlay-nifoc
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
in
{
  system = nix-darwin.lib.darwinSystem {
    system = default-system;
    modules = [
      ../hosts/Styx.nix

      home-manager.darwinModules.home-manager

      {
        nixpkgs = nixpkgsConfig;
        nix = {
          nixPath = [ "nixpkgs=${nixpkgs}" ];
          registry.nixpkgs.flake = nixpkgs;
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/Styx.nix;
        };
      }
    ];
  };
}
