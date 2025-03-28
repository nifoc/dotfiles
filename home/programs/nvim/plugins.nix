# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
{
  cutlass-nvim = buildVimPlugin {
    pname = "cutlass.nvim";
    version = "2023-12-18";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "1ac7e4b53d79410be52a9e464d44c60556282b3e";
      sha256 = "0p00xjn6da7hj10vwnighsf1y0zmndfx9d2nb95whnq6awkbyr6f";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
