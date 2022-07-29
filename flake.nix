{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    zig-overlay = {
      url = "github:arqv/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nifoc-overlay = {
      url = "github:nifoc/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ self, ... }:
    let
      config-Styx = import ./system/flakes/Styx.nix {
        nixpkgs = inputs.nixpkgs-unstable;
        inherit (inputs) home-manager;
        inherit (inputs) darwin;
        inherit inputs;
      };
    in
    config-Styx;
}
