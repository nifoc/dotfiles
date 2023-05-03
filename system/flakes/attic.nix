{ nixpkgs, home-manager, agenix, attic, inputs, ... }:

let
  default-system = "x86_64-linux";

  overlay-neovim = _: _: { neovim-nightly = inputs.neovim-flake.packages.${default-system}.neovim; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-neovim
      overlay-nifoc
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
in
{
  system = nixpkgs.lib.nixosSystem {
    system = default-system;
    modules = [
      ../hosts/attic.nix

      home-manager.nixosModules.home-manager

      agenix.nixosModules.default

      attic.nixosModules.atticd

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/attic.nix;
      }
    ];
  };
}
