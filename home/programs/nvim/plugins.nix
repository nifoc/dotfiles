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
    version = "2025-02-01";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "4988b7068001b3a772c7cc738708341e612e3c26";
      sha256 = "1x10m1c4gcv8k843mnrn8y93vv0rlxdd4na7hyb7ghh6qmsng0sj";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-02-01";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "f98fa715acc975c2dd5fb5ba7ceddeb1cc725ad2";
      sha256 = "1jm39avrfy33msf541hlf886bmsfqg4wr3k7m4h8p65xs4x8sfly";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2025-01-08";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "a0abbf18084b77d28bc70e24752e4f4fd54aea17";
      sha256 = "1117w5i7996vxx32vibb09zpzzgwaipj5ldkdgck3ds5vkcdlk53";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter-context = buildVimPlugin {
    pname = "nvim-treesitter-context";
    version = "2025-01-17";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "bece284c5322ddf6946fa4bdc383a2bc033269d7";
      sha256 = "00xslyvgndp37f54lafqw115crccasfgqf4hq8x5g6y0blnc95sv";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
