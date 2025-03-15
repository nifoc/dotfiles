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
    version = "2025-03-14";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "8b79cddc708cb8549562f0101f7f509ad7cebf97";
      sha256 = "1b2sr6250gwfgakjqh48fyydq3nmdd96nfhz1rccrns1f7nqwcdy";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-03-11";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "8a1529e46eef5efc86c34c8d9bdd313abc2ecba0";
      sha256 = "0l9mns71hh0jssxblr1q286z8hmxwbgyq1nw6scki9ffn23jwnz0";
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
    version = "2025-03-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "129fcc94fa986692926366e940a46f00d2a4abbe";
      sha256 = "0hv8f3in3qan9f8n99h7h7lxrgmx18l963ym9b98kk5ynv2b49wg";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
