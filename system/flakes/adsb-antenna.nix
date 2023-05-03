{ nixpkgs, home-manager, inputs, ... }:

let
  default-system = "aarch64-linux";

  overlay-attic = inputs.attic.overlays.default;
  overlay-neovim = _: _: { neovim-nightly = inputs.neovim-flake.packages.${default-system}.neovim; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-attic
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
      ({
        nixpkgs.overlays = nixpkgsConfig.overlays;
        nixpkgs.config = nixpkgsConfig.config;
      })

      ../hosts/adsb-antenna.nix

      home-manager.nixosModules.home-manager
      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        nix.registry.nixpkgs.flake = nixpkgs;
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/adsb-antenna.nix;
      }
    ];
  };
}
