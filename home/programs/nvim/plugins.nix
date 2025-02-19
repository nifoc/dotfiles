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
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2024-12-19";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "515acae4fd294fcefa5b15237a333c2606e958d1";
      sha256 = "1sr09v6q07q111pbcm8nc12mvgzb5f5n7bg8frrwb6dpspj4h97n";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2025-02-18";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "1a6e42bb8c5c23d8e2c0acb842dcacac5ee06761";
      sha256 = "02chfsb2ym2a938ir7jim0c922x1bkvp097qmscg7dy87fg0mhjl";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-02-18";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "1110787f1b464888c59a044c48c5119d14078044";
      sha256 = "19n9a038msypjcqdnq2m0dn1kny3rhn4fvmz4k2i99kvvbxg1jx7";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2025-02-06";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "d9ba6b7bfe29b3119a610892af67602641da778e";
      sha256 = "070jadci8x6zgxnsqaldjah1gm1p78wscsb9wpn5wn8mjkyk2m80";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter-context = buildVimPlugin {
    pname = "nvim-treesitter-context";
    version = "2025-02-17";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "198720b4016af04c9590f375d714d5bf8afecc1a";
      sha256 = "13msw9i509ncysbgkqbl2wr1c23iw3f4mxkw30sc1yk9x9nx49ri";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
