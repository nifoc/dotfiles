{ pkgs, ... }:

let
  goaccess = pkgs.goaccess;
in
{
  environment.systemPackages = [ goaccess ];
}
