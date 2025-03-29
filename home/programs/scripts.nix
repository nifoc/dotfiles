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
  home.packages =
    with pkgs;
    [
      nvd
    ]
    ++ optionals isDarwin [
      cliclick
    ];

  home.file."${user-bin-directory}" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
}
