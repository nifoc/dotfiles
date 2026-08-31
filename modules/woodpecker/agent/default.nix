{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.woodpecker.provides.agent = {
    nixos =
      { pkgs, config, ... }:
      let
        woodpeckerServer = "ci-grpc.kempkens.io";

        archLabels = {
          "aarch64-linux" = "arm64";
          "x86_64-linux" = "amd64";
        };

        archLabel = archLabels.${pkgs.stdenv.system};
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          woodpecker-agent-environment = {
            file = ../../../agenix/woodpecker/agent/environment.age;
          };
        };

        services.woodpecker-agents.agents = {
          nix = {
            enable = true;

            environment = {
              WOODPECKER_SERVER = woodpeckerServer;
              WOODPECKER_GRPC_SECURE = "true";
              WOODPECKER_BACKEND = "local";
              WOODPECKER_AGENT_LABELS = "type=nix,arch=${archLabel}";
            };

            environmentFile = [ config.age.secrets.woodpecker-agent-environment.path ];

            path = with pkgs; [
              git
              git-lfs
              woodpecker-plugin-git

              bash

              coreutils
              lixPackageSets.latest.lix
              lixPackageSets.latest.nix-eval-jobs
              lixPackageSets.latest.nix-fast-build
              lixPackageSets.latest.nix-update
            ];
          };
        };
      };
  };
}
