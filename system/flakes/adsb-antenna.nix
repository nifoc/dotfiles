{ nixpkgs, home-manager, inputs, ... }:

let
  overlay-neovim = inputs.neovim-nightly-overlay.overlay;
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
    system = "aarch64-linux";
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
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/adsb-antenna.nix;
      }
    ];
  };
}
