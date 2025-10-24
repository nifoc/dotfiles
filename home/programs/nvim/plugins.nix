# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
{
  cutlass-nvim = buildVimPlugin {
    pname = "cutlass.nvim";
    version = "2025-10-23";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "d01b5c1943050fcda8edf5c89d4419c41a65890e";
      sha256 = "09hivhxpynvw1n8f2b2fzz7jq11vrm6dvyhj9qksikrgnabsiyh9";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
