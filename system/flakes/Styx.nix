{ nixpkgs, home-manager, darwin, inputs, ... }:

let
  default-system = "aarch64-darwin";

  patched-darwin =
    let
      src = nixpkgs.legacyPackages.${default-system}.applyPatches {
        name = "nix-darwin";
        src = darwin;
        patches = [ ];
      };
    in
    nixpkgs.lib.fix (self: (import "${src}/flake.nix").outputs { inherit self nixpkgs; });

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
  system = patched-darwin.lib.darwinSystem {
    system = default-system;
    modules = [
      ../hosts/Styx.nix

      home-manager.darwinModules.home-manager
      {
        nixpkgs = nixpkgsConfig;
        nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.daniel = import ../../home/hosts/Styx.nix;
      }
    ];
  };
}
