{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Lix

    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module?ref=release-2.92";
      #url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
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
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "nix-darwin";
        home-manager.follows = "home-manager";
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
            inherit (inputs) nixpkgs home-manager nix-darwin agenix mkalias nifoc-overlay;
            inherit lix-module;
          };

          Pallas = import ./system/flakes/Pallas.nix {
            inherit (inputs) nixpkgs home-manager nix-darwin agenix mkalias nifoc-overlay;
            inherit lix-module;
          };

          tanker = import ./system/flakes/tanker.nix {
            inherit (inputs) nixpkgs disko home-manager agenix;
            inherit inputs;
          };

          carbon = import ./system/flakes/carbon.nix {
            inherit (inputs) nixpkgs disko home-manager agenix nifoc-overlay;
            inherit lix-module;
          };

          boron = import ./system/flakes/boron.nix {
            inherit (inputs) nixpkgs disko home-manager agenix nifoc-overlay;
            inherit lix-module;
          };

          mediaserver = import ./system/flakes/mediaserver.nix {
            inherit (inputs) nixpkgs home-manager agenix;
            inherit lix-module;
            inherit inputs;
          };

          argon = import ./system/flakes/argon.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager agenix nifoc-overlay;
            inherit lix-module;
          };

          neon = import ./system/flakes/neon.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager agenix nifoc-overlay;
            inherit lix-module;
          };

          adsb-antenna = import ./system/flakes/adsb-antenna.nix {
            inherit (inputs) nixpkgs nixos-hardware home-manager agenix nifoc-overlay;
            inherit lix-module;
          };
        in
        {
          darwinConfigurations = {
            "Styx" = Styx.system;
            "Pallas" = Pallas.system;
          };

          nixosConfigurations = {
            tanker = tanker.system;
            carbon = carbon.system;
            boron = boron.system;
            mediaserver = mediaserver.system;
            argon = argon.system;
            neon = neon.system;
            adsb-antenna = adsb-antenna.system;
          };

          deploy.nodes =
            let
              mkDeployNixOsConfig = node: node.deployment // {
                profiles.system = {
                  path = deploy-rs.lib.${node.arch}.activate.nixos node.system;
                };
              };

              # mkDeployMacOSConfig = node: node.deployment // {
              #   profiles.system = {
              #     path = deploy-rs.lib.${node.arch}.activate.darwin node.system;
              #   };
              # };
            in
            {
              tanker = mkDeployNixOsConfig tanker;
              carbon = mkDeployNixOsConfig carbon;
              boron = mkDeployNixOsConfig boron;
              mediaserver = mkDeployNixOsConfig mediaserver;
              argon = mkDeployNixOsConfig argon;
              neon = mkDeployNixOsConfig neon;
              adsb-antenna = mkDeployNixOsConfig adsb-antenna;
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
              shellcheck = {
                enable = true;
                excludes = [ "\\.envrc" ];
              };
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
            (pkgs.octodns.withProviders (_: [ inputs'.nifoc-overlay.packages.octodns-ovh ]))
          ];

          TREEFMT_CONFIG_FILE = config.treefmt.build.configFile;
          REMOTE_REPO_TYPE = "forgejo";
        };

        # Used for caching (in CI) only
        packages = {
          deploy-rs = inputs'.deploy-rs.packages.default;
        };
      };
    };
}
