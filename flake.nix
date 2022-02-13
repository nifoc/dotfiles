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

    zig = {
      url = "github:arqv/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nifoc-overlay = {
      url = "github:nifoc/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }:
    let
      overlay-neovim = inputs.neovim-nightly-overlay.overlay;
      overlay-zig = final: prev: { zigpkgs = inputs.zig.packages.${prev.system}; };
      overlay-nifoc = inputs.nifoc-overlay.overlay;

      nixpkgsConfig = {
        overlays = [
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
          ./darwin-configuration.nix

          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            nix.nixPath = { nixpkgs = "${nixpkgs}"; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daniel = import ./home.nix;
          }
        ];
      };
    };
}
