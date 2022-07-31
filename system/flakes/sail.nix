{ nixpkgs, home-manager, arion, inputs, ... }:

let
  overlay-arion = arion.overlay;
  overlay-neovim = inputs.neovim-nightly-overlay.overlay;
  overlay-zig = _: prev: { zigpkgs = inputs.zig-overlay.packages.${prev.system}; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-arion
      overlay-neovim
      overlay-zig
      overlay-nifoc
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
in
{
  nixosConfigurations.sail = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ({
        nixpkgs.overlays = nixpkgsConfig.overlays;
        nixpkgs.config = nixpkgsConfig.config;
      })

      arion.nixosModules.arion

      ../hosts/sail.nix

      home-manager.darwinModules.home-manager
      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = { nixpkgs = "${nixpkgs}"; };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/sail.nix;
      }
    ];
  };
}
