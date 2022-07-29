{ config, ... }:

let
  user-bin-directory = "${config.home.homeDirectory}/.bin";
in
{
  home.file."${user-bin-directory}" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
}
