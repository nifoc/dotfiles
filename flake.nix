{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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
      url = "github:nix-darwin/nix-darwin";
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
      url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    run0-sudo-shim = {
      url = "github:lordgrimmauld/run0-sudo-shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nedeco.url = "github:nedeco/nix-base-system";
    #nedeco.url = "path:/Users/dkempkens/Code/Work/nedeco/nix-base-system";
  };

  outputs =
    inputs@{
      flake-parts,
      deploy-rs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          lix-overlay =
            final: prev:
            let
              nix = final.lixPackageSets.stable.lix;
            in
            {
              nixpkgs-review = prev.nixpkgs-review.override { inherit nix; };
              nix-direnv = prev.nix-direnv.override { inherit nix; };
              nix-eval-jobs = prev.nix-eval-jobs.override { inherit nix; };
              nix-fast-build = prev.nix-fast-build.override { inherit nix; };
              nix-update = prev.nix-update.override { inherit nix; };
            };

          Styx = import ./system/flakes/Styx.nix {
            inherit (inputs)
              nixpkgs
              home-manager
              nix-darwin
              agenix
              nifoc-overlay
              nedeco
              ;

            inherit lix-overlay;
          };

          Pallas = import ./system/flakes/Pallas.nix {
            inherit (inputs)
              nixpkgs
              home-manager
              nix-darwin
              agenix
              nifoc-overlay
              ;

            inherit lix-overlay;
          };

          carbon = import ./system/flakes/carbon.nix {
            inherit (inputs)
              nixpkgs
              disko
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };

          boron = import ./system/flakes/boron.nix {
            inherit (inputs)
              nixpkgs
              disko
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };

          krypton = import ./system/flakes/krypton.nix {
            inherit (inputs)
              nixpkgs
              disko
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };

          argon = import ./system/flakes/argon.nix {
            inherit (inputs)
              nixpkgs
              nixos-hardware
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };

          neon = import ./system/flakes/neon.nix {
            inherit (inputs)
              nixpkgs
              nixos-hardware
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };

          adsb-antenna = import ./system/flakes/adsb-antenna.nix {
            inherit (inputs)
              nixpkgs
              nixos-hardware
              home-manager
              agenix
              nifoc-overlay
              run0-sudo-shim
              ;

            inherit lix-overlay;
          };
        in
        {
          darwinConfigurations = {
            "Styx" = Styx.system;
            "Pallas" = Pallas.system;
          };

          nixosConfigurations = {
            carbon = carbon.system;
            boron = boron.system;
            krypton = krypton.system;
            argon = argon.system;
            neon = neon.system;
            adsb-antenna = adsb-antenna.system;
          };

          deploy.nodes =
            let
              mkDeployNixOsConfig =
                node:
                node.deployment
                // {
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
              carbon = mkDeployNixOsConfig carbon;
              boron = mkDeployNixOsConfig boron;
              krypton = mkDeployNixOsConfig krypton;
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

      perSystem =
        {
          config,
          pkgs,
          inputs',
          ...
        }:
        {
          treefmt = {
            inherit (config.flake-root) projectRootFile;

            programs = {
              fnlfmt.enable = true;
              just.enable = true;
              nixfmt.enable = true;
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
                  excludes = [
                    "\\.envrc"
                    "system/nixos/monit/scripts/"
                  ];
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
              #inputs'.deploy-rs.packages.default
              pkgs.deploy-rs
              pkgs.just
              pkgs.nix-output-monitor
              (pkgs.octodns.withProviders (_: [
                pkgs.octodns-providers.bind
                inputs'.nifoc-overlay.packages.octodns-desec
                inputs'.nifoc-overlay.packages.octodns-ovh
              ]))
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
