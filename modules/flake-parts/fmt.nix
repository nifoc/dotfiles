{ inputs, ... }:

{
  flake-file.inputs = {
    flake-root.url = "github:srid/flake-root";

    git-hooks.url = "github:cachix/git-hooks.nix";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    make-shell.url = "github:nicknovitski/make-shell";
  };

  imports = [
    inputs.flake-root.flakeModule
    inputs.treefmt-nix.flakeModule
    inputs.git-hooks.flakeModule
    inputs.make-shell.flakeModules.default
  ];

  perSystem =
    { config, ... }:
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

      pre-commit.settings.hooks.treefmt.enable = true;

      make-shells.default = {
        inputsFrom = [
          config.flake-root.devShell
          config.treefmt.build.devShell
        ];

        env.TREEFMT_CONFIG_FILE = config.treefmt.build.configFile;
      };
    };
}
