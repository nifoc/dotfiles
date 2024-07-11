{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Lix

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      url = "github:nix-community/disko?ref=refs/tags/v1.3.0";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos-unstable";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixos-unstable";
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
        git-hooks.follows = "pre-commit-hooks-nix";
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

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          Styx = import ./system/flakes/Styx.nix {
            inherit (inputs) nixpkgs lix-module home-manager nix-darwin agenix;
            inherit inputs;
          };

          tanker = import ./system/flakes/tanker.nix {
            nixpkgs = inputs.nixos-unstable;

            inherit (inputs) disko home-manager agenix attic;
            inherit inputs;
          };

          mediaserver = import ./system/flakes/mediaserver.nix {
            nixpkgs = inputs.nixos-unstable;

            inherit (inputs) home-manager agenix;
            inherit inputs;
          };

          argon = import ./system/flakes/argon.nix {
            nixpkgs = inputs.nixos-unstable;

            inherit (inputs) nixos-hardware home-manager agenix;
            inherit inputs;
          };

          neon = import ./system/flakes/neon.nix {
            nixpkgs = inputs.nixos-unstable;

            inherit (inputs) nixos-hardware home-manager agenix;
            inherit inputs;
          };

          adsb-antenna = import ./system/flakes/adsb-antenna.nix {
            nixpkgs = inputs.nixos-unstable;

            inherit (inputs) nixos-hardware home-manager;
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

          colmena =
            let
              nixosConf = self.nixosConfigurations;
            in
            {
              meta = {
                # Since I'm only deploying from Styx ...
                nixpkgs = import inputs.nixpkgs {
                  system = "aarch64-darwin";
                };

                nodeNixpkgs = builtins.mapAttrs (_name: value: value.pkgs) nixosConf;
                nodeSpecialArgs = builtins.mapAttrs (_name: value: value._module.specialArgs) nixosConf;
              };

              tanker = tanker.colmena;
              mediaserver = mediaserver.colmena;
              argon = argon.colmena;
              neon = neon.colmena;
              adsb-antenna = adsb-antenna.colmena;
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
            pkgs.colmena
            pkgs.nix-output-monitor
          ];

          TREEFMT_CONFIG_FILE = config.treefmt.build.configFile;
          REMOTE_REPO_TYPE = "forgejo";
        };
      };
    };
}
