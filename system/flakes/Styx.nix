{ nixpkgs, home-manager, darwin, inputs, ... }:

let
  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };
  overlay-neovim = inputs.neovim-nightly-overlay.overlay;
  overlay-zig = _: prev: { zigpkgs = inputs.zig-overlay.packages.${prev.system}; };
  overlay-nifoc = inputs.nifoc-overlay.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-x86
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
  darwinConfigurations."Styx" = darwin.lib.darwinSystem {
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
