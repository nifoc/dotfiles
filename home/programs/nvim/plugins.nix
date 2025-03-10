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
    version = "2025-02-24";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "96c9d19ce81b26053055ad6f688277d655b3f7d2";
      sha256 = "0w8r0h9sk3gspahiv203wxj744cry70sra2gf230x2pfrysp09g0";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2025-03-09";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "afe977dadd8bccbd3919b29a8b5beb5b8bfc6cdb";
      sha256 = "06y1ls9mbh5nwvxmhrb6qr131k92lhiiwv03v9ka6gsc3q9wgv22";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-03-07";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "fd26f8626c03b424f7140d454031d1dcb8d23513";
      sha256 = "14wkqldhx04qbnn9z6wpawi7cdnx7g0g3xcn9rp7bh4752d5994g";
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
