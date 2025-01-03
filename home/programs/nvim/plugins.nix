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
  move-nvim = buildVimPlugin {
    pname = "move.nvim";
    version = "2023-10-25";
    src = fetchFromGitHub {
      owner = "hinell";
      repo = "move.nvim";
      rev = "30047fbb4ee0f3b79bf969d37d889085e96b44e6";
      sha256 = "1z0k361n41md768jxk9sngx06lv93hcnss64k7h5clg5khxf6pzg";
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
    version = "2025-01-03";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "6935286b4ee3d938954e446d657eebee71b4d07a";
      sha256 = "0pkdf1fpsv0s34c253xp4c1fc84fnqda02j4g3ly6pih0jnkazrj";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2025-01-03";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "a8ef5e6e497b3ebeaaf35b939c07c211563b2e05";
      sha256 = "17z93azbxd3dayvyf5f0fn5k00hq7xfb1aji6pnlq502xilkj9bg";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-12-14";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "872dcfa0418f4a33b7437fb4d9f4e89f2f000d74";
      sha256 = "1jnxhj25x9mzm2m8sqgp8viwd8kswyrc1k4s4yqxh457m8xj6yn1";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-11-17";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "b464658e9b880f463b9f7e6ccddd93fb0013f559";
      sha256 = "0p4v49saqfsc8kinl3wc3zhmr6m2q86vmay2f10payp29n4v3did";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-11-22";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "ad8f0a472148c3e0ae9851e26a722ee4e29b1595";
      sha256 = "08vlvi9iwhl5qy924s6dmxaczg1yg096vdchp7za5p7wnb7w3zkg";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-12-16";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "9238947645ce17d96f30842e61ba81147185b657";
      sha256 = "1117w5i7996vxx32vibb09zpzzgwaipj5ldkdgck3ds5vkcdlk53";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter-context = buildVimPlugin {
    pname = "nvim-treesitter-context";
    version = "2024-12-20";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "2bcf700b59bc92850ca83a1c02e86ba832e0fae0";
      sha256 = "0xs3ha4zd96rzy5w9hyjzyyq88nnv1bnkgg2splfmnf3mhy4r0ac";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
