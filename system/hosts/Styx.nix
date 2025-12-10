{ pkgs, ... }:

let
  homeDir = "/Users/dkempkens";
in
{
  imports = [
    ../../agenix/hosts/Styx/config.nix

    ../darwin/attic.nix

    ../darwin/fake-homebrew.nix

    ../darwin/git.nix
  ];

  system = {
    stateVersion = 5;
    primaryUser = "dkempkens";
  };

  nix = {
    package = pkgs.lixPackageSets.latest.lix;

    settings = {
      extra-platforms = [ "x86_64-darwin" ];

      builders-use-substitutes = true;

      substituters = [
        "https://nix-cache.kempkens.network/nifoc-systems?priority=30"
        "https://nix-cache.kempkens.network/nifoc-ci?priority=35"
        "https://cache.garnix.io?priority=60"
      ];

      trusted-public-keys = [
        "nifoc-systems:jLf2XYhCdf7/VAT7c2sIgaqm/1+NCXwapE2qs5fGrEw="
        "nifoc-ci:YGmPyqh3kbF7eQhMX9esbQpdYU4f3Q+WEx+sv97KKHo="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      sandbox = "relaxed";
      netrc-file = "/etc/nix/netrc";
    };
  };

  users = {
    users.dkempkens = {
      home = homeDir;
    };
  };

  environment = {
    darwinConfig = "${homeDir}/.config/nixpkgs/system/hosts/Styx.nix";
  };
}
