{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.git-crypt ];

  programs.git.enable = true;
}
