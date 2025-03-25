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
    version = "2025-03-24";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "e329e94a6a0a5ccf6ec8bfec1d10faf5eaae665f";
      sha256 = "0c3qrvxafp86v62iccywsf3nnk3n9zav1xbkn1gq32q596kq2yxc";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-03-21";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "fb733ac734249ccf293e5c8018981d4d8f59fa8f";
      sha256 = "04qz643mgjr32lwk9lw9bq2cjy5cdxmw5vldc3zyxrcclngyv0sg";
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
    version = "2025-03-19";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "93b29a32d5f4be10e39226c6b796f28d68a8b483";
      sha256 = "12ixiqb4bj7n3kkzqi81hyhn3bjsb93250gvfy12bxya2l5bi20g";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
