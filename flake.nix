{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Lix

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Tools

    flake-parts.url = "github:hercules-ci/flake-parts";

    flake-root.url = "github:srid/flake-root";

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays

    disko = {
      url = "github:nix-community/disko?ref=refs/tags/v1.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager?rev=587fcca66e9d11c8e2357053c096a8a727c120ab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "nix-darwin";
        home-manager.follows = "home-manager";
      };
    };

    attic = {
      url = "github:zhaofengli/attic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
      };
    };

    nifoc-overlay = {
      url = "git+https://git.kempkens.io/daniel/nix-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    mkalias = {
      url = "github:reckenrode/mkalias";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, lix-module, deploy-rs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          Styx = import ./system/flakes/Styx.nix {
            inherit (inputs) nixpkgs home-manager nix-darwin agenix neovim-nightly-overlay mkalias nifoc-overlay;
            inherit lix-module;
          };

          tanker = import ./system/flakes/tanker.nix {
            inherit (inputs) nixpkgs disko home-manager agenix attic;
            inherit inputs;
          };

          mediaserver = import ./system/flakes/mediaserver.nix {
            inherit (inputs) nixpkgs home-manager agenix;
            inherit lix-module;
            inherit inputs;
          };

          argon = import ./system/flakes/argon.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager agenix neovim-nightly-overlay nifoc-overlay;
            inherit lix-module;
          };

          neon = import ./system/flakes/neon.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager agenix neovim-nightly-overlay nifoc-overlay;
            inherit lix-module;
          };

          adsb-antenna = import ./system/flakes/adsb-antenna.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager;
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
            neon = neon.system;
            adsb-antenna = adsb-antenna.system;
          };

          deploy.nodes =
            let
              mkDeployConfig = node: node.deployment // {
                profiles.system = {
                  path = deploy-rs.lib.${node.arch}.activate.nixos node.system;
                };
              };
            in
            {
              tanker = mkDeployConfig tanker;
              mediaserver = mkDeployConfig mediaserver;
              argon = mkDeployConfig argon;
              neon = mkDeployConfig neon;
              adsb-antenna = mkDeployConfig adsb-antenna;
            };
        };

      imports = [
        inputs.flake-root.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.git-hooks.flakeModule
      ];

      systems = [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = { config, pkgs, inputs', ... }: {
        treefmt = {
          package = pkgs.treefmt1;
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
            inputs'.deploy-rs.packages.default
            pkgs.just
            pkgs.nix-output-monitor
          ];

          TREEFMT_CONFIG_FILE = config.treefmt.build.configFile;
          REMOTE_REPO_TYPE = "forgejo";
        };
      };
    };
}
