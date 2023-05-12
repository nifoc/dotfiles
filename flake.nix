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

    attic = {
      url = "github:zhaofengli/attic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nifoc-overlay = {
      url = "github:nifoc/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    let
      Styx = import ./system/flakes/Styx.nix {
        inherit (inputs) nixpkgs home-manager darwin;
        inherit inputs;
      };

      sail = import ./system/flakes/sail.nix {
        inherit (inputs) nixpkgs deploy-rs home-manager agenix;
        inherit inputs;
      };

      attic = import ./system/flakes/attic.nix {
        inherit (inputs) nixpkgs deploy-rs home-manager agenix attic;
        inherit inputs;
      };

      mediaserver = import ./system/flakes/mediaserver.nix {
        inherit (inputs) nixpkgs deploy-rs home-manager agenix;
        inherit inputs;
      };

      adsb-antenna = import ./system/flakes/adsb-antenna.nix {
        inherit (inputs) nixpkgs home-manager;
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        "Styx" = Styx.system;
      };

      nixosConfigurations = {
        sail = sail.system;
        attic = attic.system;
        mediaserver = mediaserver.system;
        adsb-antenna = adsb-antenna.system;
      };

      deploy.nodes = {
        sail = sail.deployment;
        attic = attic.deployment;
        mediaserver = mediaserver.deployment;
      };
    };
}
