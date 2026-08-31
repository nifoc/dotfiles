{ inputs, ... }:

{
  flake-file.inputs = {
    git-hooks.url = "github:cachix/git-hooks.nix";

    make-shell.url = "github:nicknovitski/make-shell";
  };

  imports = [
    inputs.git-hooks.flakeModule
    inputs.make-shell.flakeModules.default
  ];

  perSystem =
    { pkgs, config, ... }:
    {
      pre-commit = {
        settings = {
          package = pkgs.prek;

          hooks = {
            deadnix.enable = true;
            shellcheck = {
              enable = true;
              excludes = [
                "\\.envrc"
                "system/nixos/monit/scripts/"
                "home/programs/zsh/scripts/"
              ];
            };
            # statix.enable = true;
          };
        };
      };

      make-shells.default.inputsFrom = [
        config.pre-commit.devShell
      ];
    };
}
