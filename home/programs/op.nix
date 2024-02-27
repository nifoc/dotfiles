{ pkgs, lib, ... }:

let
  op = pkgs.agilebits-op;
in
{
  home.packages = [ op ];

  programs.fish.interactiveShellInit = (lib.mkOrder 200 ''
    ${op}/bin/op completion fish | source
  '');
}
