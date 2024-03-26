{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.attic-client ];
}
