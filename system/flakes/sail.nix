{ nixpkgs, home-manager, arion, inputs, ... }:

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
    system = "x86_64-linux";
    modules = [
      arion.nixosModules.arion

      ../hosts/sail.nix

      home-manager.nixosModules.home-manager

      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/sail.nix;
      }
    ];
  };
}
