{ pkgs, ... }:

{
  home.packages = [ pkgs.eternal-terminal ];

  home.sessionVariables.ET_NO_TELEMETRY = "1";
}
