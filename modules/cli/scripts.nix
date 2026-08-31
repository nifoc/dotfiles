{
  flake-file.inputs = {
    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.cli = {
    homeManager =
      {
        pkgs,
        config,
        lib,
        inputs',
        ...
      }:
      let
        inherit (pkgs.stdenv) isDarwin;
        inherit (lib) optionals;

        user-bin-directory = "${config.home.homeDirectory}/.bin";
      in
      {
        home = {
          packages = optionals isDarwin [
            inputs'.nifoc-overlay.packages.cliclick
          ];

          file."${user-bin-directory}" = {
            source = ../../files/cli/scripts;
            recursive = true;
            executable = true;
          };
        };
      };
  };
}
