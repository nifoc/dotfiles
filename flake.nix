{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Tools

    flake-parts.url = "github:hercules-ci/flake-parts";

    flake-root.url = "github:srid/flake-root";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks-nix = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "nix-darwin";
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

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          Styx = import ./system/flakes/Styx.nix {
            inherit (inputs) nixpkgs home-manager nix-darwin;
            inherit inputs;
          };

          tanker = import ./system/flakes/tanker.nix {
            inherit (inputs) nixpkgs nixos-stable disko deploy-rs home-manager agenix attic;
            inherit inputs;
          };

          mediaserver = import ./system/flakes/mediaserver.nix {
            inherit (inputs) nixpkgs deploy-rs home-manager agenix;
            inherit inputs;
          };

          argon = import ./system/flakes/argon.nix {
            inherit (inputs) nixpkgs nixos-hardware deploy-rs home-manager agenix;
            inherit inputs;
          };

          weather-sdr = import ./system/flakes/weather-sdr.nix {
            inherit (inputs) nixpkgs deploy-rs home-manager agenix;
            inherit inputs;
          };

          adsb-antenna = import ./system/flakes/adsb-antenna.nix {
            inherit (inputs) nixpkgs nixos-hardware deploy-rs home-manager;
            inherit inputs;
          };
        in
        {
          darwinConfigurations = {
            "Styx" = Styx.system;
          };

          nixosConfigurations = {
            tanker = tanker.system;
            mediaserver = mediaserver.system;
            argon = argon.system;
            weather-sdr = weather-sdr.system;
            adsb-antenna = adsb-antenna.system;
          };

          deploy.nodes = {
            tanker = tanker.deployment;
            mediaserver = mediaserver.deployment;
            argon = argon.deployment;
            weather-sdr = weather-sdr.deployment;
            adsb-antenna = adsb-antenna.deployment;
          };
        };

      imports = [
        inputs.flake-root.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.pre-commit-hooks-nix.flakeModule
      ];

      systems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = { config, pkgs, inputs', ... }: {
        treefmt = {
          inherit (config.flake-root) projectRootFile;

          programs = {
            fnlfmt.enable = true;
            nixpkgs-fmt.enable = true;
            shfmt.enable = true;
            yamlfmt.enable = true;
          };
        };

        pre-commit = {
          settings = {
            hooks = {
              deadnix.enable = true;
              shellcheck.enable = true;
              # statix.enable = true;
              treefmt.enable = true;
            };
          };
        };

        devShells.default = pkgs.mkShell {
          name = "dotfiles";

          inputsFrom = [
            config.flake-root.devShell
            config.treefmt.build.devShell
            config.pre-commit.devShell
          ];

          packages = [
            inputs'.agenix.packages.agenix
            inputs'.deploy-rs.packages.deploy-rs
          ];

          TREEFMT_CONFIG_FILE = config.treefmt.build.configFile;
        };
      };
    };
}
