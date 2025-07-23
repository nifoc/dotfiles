{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;
in
{
  programs.yazi = {
    enable = true;

    settings = {
      flavor = {
        use = "dracula";
      };
    };

    flavors = {
      dracula = fetchFromGitHub {
        owner = "dracula";
        repo = "yazi";
        rev = "99b60fd76df4cce2778c7e6c611bfd733cf73866";
        hash = "sha256-dFhBT9s/54jDP6ZpRkakbS5khUesk0xEtv+xtPrqHVo=";
      };
    };
  };
}
