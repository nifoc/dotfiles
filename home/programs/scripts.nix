{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;

  user-bin-directory = "${config.home.homeDirectory}/.bin";
in
{
  home.packages = optionals isDarwin [
    pkgs.cliclick
  ];

  home.file."${user-bin-directory}" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
}
