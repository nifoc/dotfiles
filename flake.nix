{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig-overlay = {
      url = "github:arqv/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nifoc-overlay = {
      url = "github:nifoc/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    let
      config-Styx = import ./system/flakes/Styx.nix {
        inherit (inputs) nixpkgs;
        inherit (inputs) home-manager;
        inherit (inputs) darwin;
        inherit inputs;
      };

      config-sail = import ./system/flakes/sail.nix {
        inherit (inputs) nixpkgs;
        inherit (inputs) home-manager;
        inherit (inputs) arion;
      };
    in
    config-Styx // config-sail;
}
