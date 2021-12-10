{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      daniel = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-darwin";
        homeDirectory = "/Users/daniel";
        username = "daniel";
        stateVersion = "21.11";

        configuration = { config, pkgs, ... }:
          let
            overlay-neovim = inputs.neovim-nightly-overlay.overlay;
          in
          {
            nixpkgs = {
              overlays = [
                overlay-neovim
              ];

              config = {
                allowUnfree = true;
                allowBroken = true;
              };
            };

            imports = [ ./home.nix ];
          };
      };
    };
  };
}
