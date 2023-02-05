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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "darwin";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.url = "github:nixos/nixpkgs?rev=fad51abd42ca17a60fc1d4cb9382e2d79ae31836";
    };

    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nifoc-overlay = {
      url = "github:nifoc/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    let
      Styx = import ./system/flakes/Styx.nix {
        inherit (inputs) nixpkgs;
        inherit (inputs) home-manager;
        inherit (inputs) darwin;
        inherit inputs;
      };

      sail = import ./system/flakes/sail.nix {
        inherit (inputs) nixpkgs;
        inherit (inputs) home-manager;
        inherit (inputs) agenix;
        inherit (inputs) arion;
        inherit inputs;
      };

      adsb-antenna = import ./system/flakes/adsb-antenna.nix {
        inherit (inputs) nixpkgs;
        inherit (inputs) home-manager;
        inherit (inputs) arion;
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        "Styx" = Styx.system;
      };

      nixosConfigurations = {
        sail = sail.system;
        adsb-antenna = adsb-antenna.system;
      };
    };
}
