{ inputs, ... }:

{
  flake-file.inputs = {
    make-shell.url = "github:nicknovitski/make-shell";

    agenix.url = "github:ryantm/agenix";
  };

  imports = [
    inputs.make-shell.flakeModules.default
  ];

  perSystem =
    { pkgs, inputs', ... }:
    {
      make-shells.default = {
        name = "dotfiles";

        packages = with pkgs; [
          (inputs'.agenix.packages.agenix.override { nix = pkgs.lixPackageSets.latest.lix; })
          just
        ];

        env.REMOTE_REPO_TYPE = "forgejo";
      };
    };
}
