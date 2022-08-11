{ nixpkgs, home-manager, darwin, inputs, ... }:

let
  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };
  overlay-neovim = inputs.neovim-nightly-overlay.overlay;
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-x86
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
  system = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ../hosts/Styx.nix

      home-manager.darwinModules.home-manager
      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = { nixpkgs = "${nixpkgs}"; };
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/Styx.nix;
      }
    ];
  };
}
