{ inputs, ... }:

{
  flake-file.inputs = {
    direnv-instant.url = "github:Mic92/direnv-instant";
  };

  den.aspects.base = {
    homeManager =
      { pkgs, lib, ... }:
      {
        imports = [
          inputs.direnv-instant.homeModules.direnv-instant
        ];

        programs = {
          direnv = {
            enable = true;

            nix-direnv = {
              enable = true;
              package = pkgs.lixPackageSets.latest.nix-direnv;
            };

            config = {
              strict_env = true;
              warn_timeout = "1m";
              hide_env_diff = true;
            };

            stdlib =
              lib.mkOrder 1000 # sh
                ''
                  project() {
                    local cmd=$1
                    log_status "project $*"
                    shift

                    export PROJECT_DIR=$PWD

                    "project_$cmd" "$@"
                  }
                '';
          };

          direnv-instant.enable = true;
        };
      };
  };
}
