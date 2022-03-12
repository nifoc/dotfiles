# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "1645465106";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "7abfc924714d3b7f19f3674cca0231cf6ef2050f";
      sha256 = "f+08N88A5XkUR28HXYEc537iSUHAqdVQFSpSGb1GABM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/impatient.nvim";
  };
  FixCursorHold-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FixCursorHold.nvim";
    version = "1645084379";
    src = pkgs.fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "1bfb32e7ba1344925ad815cb0d7f901dbc0ff7c1";
      sha256 = "OFQkcciHQa4Mp3BieBY5EqMsTqT40e1S41+oa6ZzMSw=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim";
  };
  popup-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "popup.nvim";
    version = "1637254091";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
      sha256 = "dNWz/xovUg55fDZUpVs/2kLphk3lqQyvPtc9ATwbeSQ=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lua/popup.nvim";
  };
  plenary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "1646401868";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "14dfb4071022b22e08384ee125a5607464b6d397";
      sha256 = "nxB5Gx0xI1oREcFHNKbCWdKGoqnZFqKgHE/EOU/Kgxk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "1645288522";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "4415d1aaa56f73b9c05795af84d625c610b05d3b";
      sha256 = "0nuv0kBPGV9F6Nmt5GERUG9E8kkXFrbS+cJ1CVQAQ9g=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons";
  };
  which-key-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "which-key.nvim";
    version = "1642619077";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "28d2bd129575b5e9ebddd88506601290bb2bb221";
      sha256 = "bz41c/zenRVVIkwtHHIi8wF/LZn2JEkFc6tkPv/BYY4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/folke/which-key.nvim";
  };
  vim-yoink = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-yoink";
    version = "1631699595";
    src = pkgs.fetchFromGitHub {
      owner = "svermeulen";
      repo = "vim-yoink";
      rev = "89ed6934679fdbc3c20f552b50b1f869f624cd22";
      sha256 = "ekGKOYzmdaMqAun/3fRGlhA7bLKuhzsXsEcFNukgFWU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/svermeulen/vim-yoink";
  };
  vim-cutlass = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-cutlass";
    version = "1583100466";
    src = pkgs.fetchFromGitHub {
      owner = "svermeulen";
      repo = "vim-cutlass";
      rev = "7afd649415541634c8ce317fafbc31cd19d57589";
      sha256 = "j5W9q905ApDf3fvCIS4UwyHYnEZu5Ictn+6JkV/xjig=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/svermeulen/vim-cutlass";
  };
  vim-subversive = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-subversive";
    version = "1643202309";
    src = pkgs.fetchFromGitHub {
      owner = "svermeulen";
      repo = "vim-subversive";
      rev = "6286cda3f9222bfd490fe34a00a2d8cd4925adec";
      sha256 = "V+WHNtR1L2SXtlPaojqcgW4giRY1QrMzvmB+3FvuTtM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/svermeulen/vim-subversive";
  };
  lightspeed-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lightspeed.nvim";
    version = "1646869851";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "lightspeed.nvim";
      rev = "58c9e321b188e040703b01f16922623911f11117";
      sha256 = "2rV0s8H3Fey7VjO+4xOZCfglB7ebXZky/N2oZKY1PPU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/ggandor/lightspeed.nvim";
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "1643281801";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a219971291c56bcca3827cb7bd40aaaef23feeca";
      sha256 = "r1VhURChdutQFO9fiF+YV+MJycuj6xohTmR9DYpUFdk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "1647111747";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "69a02b88d8ca937b2e00ecba947f62f115bead90";
      sha256 = "tyMXyW/sClSORuYP6Zhdf7PvsDpjmcJPLdjnIile6N0=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter";
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "1645025876";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "9df82a27a49e1c14e9d7416b537517a79d675086";
      sha256 = "Qfzpey5WOZdVOySDzAhf5Rt7Tkam6pdsx3t49rJmGcI=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/playground";
  };
  Jenkinsfile-vim-syntax = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "Jenkinsfile-vim-syntax";
    version = "1611625602";
    src = pkgs.fetchFromGitHub {
      owner = "martinda";
      repo = "Jenkinsfile-vim-syntax";
      rev = "0d05729168ea44d60862f17cffa80024ab30bcc9";
      sha256 = "/qUlzGfo2OhHEBGaoTH8K4VVT0Zg9ocJBb84orMD4xc=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/martinda/Jenkinsfile-vim-syntax";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "1647100146";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "1e4d5e59df389d26b772d525abe2b1a14b2b4099";
      sha256 = "6mefI2KqIScM4v8Vu6GjpcOw29vQSTyBn6mXCrLtjQo=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-telescope/telescope.nvim";
  };
  telescope-zf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-zf-native.nvim";
    version = "1644962465";
    src = pkgs.fetchFromGitHub {
      owner = "natecraddock";
      repo = "telescope-zf-native.nvim";
      rev = "dabcdff0b26d0313f8a9add1e29193d5c030c7b5";
      sha256 = "+Ku+MEczj+KSLb0rcqKhAQAMdm+PeiFMLrVp1lIIpDI=";
      fetchSubmodules = true;
    };
    nativeBuildInputs = with pkgs; [ just zigpkgs."0.9.1" ];
    buildPhase = ''
      just clean
      XDG_CACHE_HOME=./xdg_cache just build
      mv lib/libzf.so lib/libzf-osx-arm64.so
      rm -rf ./xdg_cache
    '';
    meta.homepage = "https://github.com/natecraddock/telescope-zf-native.nvim";
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "1642582804";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "cef52b8da07648b750d7f1e8fb93f12cb9482988";
      sha256 = "BrseGCUZV689EbeLAme2PBeWOerwDV3lGaRTihS4l+M=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/ahmedkhalf/project.nvim";
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "1642601933";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "98b1ebf198836bdc226c0562b9f906584e6c400e";
      sha256 = "8uj5TxO9XZlSCB4lVRbKRc1IlUEKcBf/4bDviwuxEgs=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/folke/todo-comments.nvim";
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "1646865212";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "096398a07c2dc08d785266f9f55ddcb462ba0749";
      sha256 = "ATH0h3d3EVBq96tptitKdzRLrGAeKfdNhgbsmJoF6xU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  null-ls-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "null-ls.nvim";
    version = "1647110590";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "abaff6ed4dad96831031fc55a6ef55ac7bc57e13";
      sha256 = "2zVxKYQEV+TmOCSnowesVOEqCeX01Ri442pWxkuacIg=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/jose-elias-alvarez/null-ls.nvim";
  };
  trouble-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "trouble.nvim";
    version = "1640940059";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "trouble.nvim";
      rev = "20469be985143d024c460d95326ebeff9971d714";
      sha256 = "t6zNugUO75TxOs4T83H8Slr04m3Dv113p/M/4XPg4QE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/folke/trouble.nvim";
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind-nvim";
    version = "1644054955";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "93e98a0c900327ce7e9be1cbf24aebbe7170e375";
      sha256 = "0103K5lnzWCyuT/qwiBUo5PJ7lUX7fo+zNeEnQClI7A=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/onsails/lspkind-nvim";
  };
  virtual-types-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virtual-types.nvim";
    version = "1644848008";
    src = pkgs.fetchFromGitHub {
      owner = "jubnzv";
      repo = "virtual-types.nvim";
      rev = "094fcf2ad2c434d4b5d1f2dcad45c233e5f6f0c4";
      sha256 = "2zVEBpJToEryN89ZU4nxpMwO0J/Ug2gshJLSGh5XOC8=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/jubnzv/virtual-types.nvim";
  };
  lsp-status-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lsp-status.nvim";
    version = "1638992828";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "4073f766f1303fb602802075e558fe43e382cc92";
      sha256 = "5K7AtqAAiuma1bHba2ijbfHKWr9r7Dxd8BfGU2zxLKo=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lua/lsp-status.nvim";
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "1642116587";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "db98338285574265a6ce54370b54d9f939e091bb";
      sha256 = "QnrzzbWonGsnXCXhHmMLqf3LeDw67D6UtGcn9Ytu0MY=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/RRethy/vim-illuminate";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "1646190781";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "1001683bee3a52a7b7e07ba9d391472961739c7b";
      sha256 = "uJ/Fex32smh47R21ozAUDj+4YmE1djhz7PPm/yrwTfw=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/nvim-cmp";
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "1642242623";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba";
      sha256 = "itlKrCBo8wMNBCknW+7INOyVmwbcwmkGLzpc2lvvqk4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp";
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "1644910895";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "414619286928901600cf5b5ccb2f62666f82d3bd";
      sha256 = "IQMGVZiMWq3OykG4XMiwvWlxyzNlpohiBPH50xMPxFM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1646995094";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "5d62337e4354ed0eae3b7dba4c2c289cea117c19";
      sha256 = "m575EGCw1heSJbFag6QRUh9Tw/Gg3U5DSjded0RQw28=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/L3MON4D3/LuaSnip";
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "1641154010";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "d6f837f4e8fe48eeae288e638691b91b97d1737f";
      sha256 = "vkDOW0882wG22z1s4npjGPUJyHd5boW8KWDIoy+WrjI=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/saadparwaiz1/cmp_luasnip";
  };
  cmp-nvim-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lua";
    version = "1633919304";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lua";
      rev = "d276254e7198ab7d00f117e88e223b4bd8c02d21";
      sha256 = "/xUfw5adjXu8ySZBBFrLVJ1FCNJzfh79wf+wJsW6sIY=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lua";
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "1643823794";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "466b6b8270f7ba89abd59f402c73f63c7331ff6e";
      sha256 = "xYzTpqVKpBBnajqqRRzAXlHAC13VGK1D9mFr3bntepY=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-path";
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "1645413199";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "d66c4c2d376e5be99db68d2362cd94d250987525";
      sha256 = "itDEtoRvZn1mtLhT9WtqKVXoMRe5Qw0/QUf+TFzGNVk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-buffer";
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "1638415112";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "a6b4c95ee922cace635b5a46c7fcc691d2559fbb";
      sha256 = "Skdb113mgJqPJGUCk08ymo2IrnCyMO2KY36rOIxFHRk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/ray-x/cmp-treesitter";
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "1644756337";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "f4beb74e8e036f9532bedbcac0b93c7a55a0f8b0";
      sha256 = "8KlmtXYfapji+n6tntAGlTcHYT3CJtdZaFR8luEu7Go=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-cmdline";
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "1635415577";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "29d12e55cf49ee07b829114ad39b161cad2544ab";
      sha256 = "i3lc1u+ml1Zh6bx+uaiIYZZbQhAhJyMbeWzIYwgZlXA=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol";
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "1646569977";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "d2cde7c5802b34d6391a8a3555a3b7b56482f2aa";
      sha256 = "oxrWiWV5W5D+X8atJY4Cfbp/EZUI0zIYZMV1ujCVcbE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/windwp/nvim-autopairs";
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "1646385778";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "57035b5814f343bc6110676c9ae2eacfcd5340c2";
      sha256 = "gYm8/MLCBBhrH1vSrBxK33wOtG5CYaXJWn9N5e4a0hk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/windwp/nvim-ts-autotag";
  };
  Comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "Comment.nvim";
    version = "1647079487";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "399f92d57900ddeefe384f156e2d11fc93a93356";
      sha256 = "iyIxNxrvcWpVbzDAugAEP9j/BV7mLpWTYipgknXQKkA=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "1646181875";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "7c6b5fe0926f52854f193d058cd98d2e74c3d483";
      sha256 = "FF+3qWzdHSYC9SlNG8JOt+pmht39pSiJMcYuXL+KL/8=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  vim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-surround";
    version = "1643508337";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-surround";
      rev = "baf89ad26488f6a7665d51b986f5c7ad2d22b30b";
      sha256 = "KLZztzV/3zh52MZ9YG0F/wQnke4EorXOB1YJ/sUL908=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/tpope/vim-surround";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "1645154316";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "7fd8806138f404498db7a3e848d8fa55ad61e7cf";
      sha256 = "94MxL1tajiKfgA8gpu2cO3jQmRj64Kg80efzlgHfMhg=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/andymass/vim-matchup";
  };
  undotree = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "undotree";
    version = "1645039348";
    src = pkgs.fetchFromGitHub {
      owner = "mbbill";
      repo = "undotree";
      rev = "08e259be24d4476c1ee745dc735eefd44f90efdc";
      sha256 = "vsbJxVIAxwPssVC3wGNQmoUw8XNw4itkQx1SoDMvk5Q=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/mbbill/undotree";
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "1646668162";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "88a44ade818f9ee7ba730aa4096250e22b243808";
      sha256 = "F7R5V70ta/9s9qn+QkZtk5AFb/PfKtuOqPHP/Y6/WHI=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1646838127";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "d5904e8a3434acb151a4948b1b3d4760a2a12bb1";
      sha256 = "PK8jgMxjjQqIuEAQ066sGc4hIH7TiRXizQUTpzsiIOc=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/akinsho/bufferline.nvim";
  };
  nvim-tree-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "1647093634";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "d93a93c9c1a12748f09c5e01867908e9985cfccc";
      sha256 = "TPnUUOk4Y6fIY5igMIvRS6tUMKCzc+BLPpPXJP1N+pE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "1646791761";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "9915d46ba9361784c70036bb7259c436249e5b0c";
      sha256 = "ZDNRTgk5Aqx42T7mBalDMNdkhn7IG5xAcqK+e+Gpjj0=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lukas-reineke/indent-blankline.nvim";
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "1645684789";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "29db24c5e94243df1f34f47bbcb4e7803204cae4";
      sha256 = "alIOA1ggGzsefcTfA0cGALaHvndoZXBbBAWkK1u7YRc=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lukas-reineke/virt-column.nvim";
  };
  neogit = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neogit";
    version = "1646486476";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "f30879799f7c19d0047c6f3d3a86b818eaf0f201";
      sha256 = "KP34tdI+hHYUEmFYhLb996zQl51aoTVhUnaexNwv1a0=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/TimUntersberger/neogit";
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "1647007951";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "7de953329ff696408bd38d3218b0239839d285e0";
      sha256 = "Q47mMcv4esfqSJMNFF1kr8Zi5mjzSkQVrpLsMM7AzXc=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "1645219331";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "0a19491a9c15c0b9283a6698e31ea7471419d5f8";
      sha256 = "jkl7TDaR8E+vsOgZ0vdMDT/q4LSiZgc1G/uqKB+3A2c=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/spellsitter.nvim";
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "1646210494";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "f81b48d298c0ff7479b66568d9cc1a4794c196d0";
      sha256 = "Xmf6oO7yHe4sHXVzEwjg0u4VZTLQDxYhnSvI2bb8nwg=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/rcarriga/nvim-notify";
  };
  nvim-visual-eof-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-visual-eof.lua";
    version = "1615701642";
    src = pkgs.fetchFromGitHub {
      owner = "LumaKernel";
      repo = "nvim-visual-eof.lua";
      rev = "3c001c6cda4db5bf62ba33344e61e30230acd9eb";
      sha256 = "azT2Cv3G5/HHsu/PkW/vW0CmrnZ/T7Q6x9Mlypr6pFY=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/LumaKernel/nvim-visual-eof.lua";
  };
  FTerm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FTerm.nvim";
    version = "1641276048";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "FTerm.nvim";
      rev = "eabb65f23ba48ec9e8abb9a2514f99b77b3bc6f2";
      sha256 = "xoah6q7GKXyt8UhwuhDL8MVpC0ln1e2L1J6gEhOkYS4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/numToStr/FTerm.nvim";
  };
  editorconfig-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "editorconfig-vim";
    version = "1642820146";
    src = pkgs.fetchFromGitHub {
      owner = "editorconfig";
      repo = "editorconfig-vim";
      rev = "a8e3e66deefb6122f476c27cee505aaae93f7109";
      sha256 = "dtIAIOLskw5rsEuI23aUVTl+JJy59+O820SZO2K0ZqY=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/editorconfig/editorconfig-vim";
  };
}
