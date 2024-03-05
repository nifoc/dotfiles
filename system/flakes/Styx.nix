{ nixpkgs, home-manager, nix-darwin, agenix, inputs, ... }:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };
  overlay-nur = inputs.nurpkgs.overlay;
  overlay-agenix = agenix.overlays.default;
  overlay-attic = inputs.attic.overlays.default;
  overlay-mkalias = _: _: { inherit (inputs.mkalias.packages.${default-system}) mkalias; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-x86
      overlay-nur
      overlay-agenix
      overlay-attic
      overlay-mkalias
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

      agenix.darwinModules.default

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
