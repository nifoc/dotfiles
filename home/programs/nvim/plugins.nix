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
    version = "2025-03-26";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "85168f15808d89b0222313652b9d2777eda3cb08";
      sha256 = "1mn92s3v0rp5szy9cclnwlvvj61cmib98nwsz5xybw0a3wfmil45";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-03-26";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "401e50fae626c4707af12114b5ddb7bb9f4236a4";
      sha256 = "1d8zvgzn91l9cwanbhwnzchhml00wi53qsy228pagisxnhkr7w7v";
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
