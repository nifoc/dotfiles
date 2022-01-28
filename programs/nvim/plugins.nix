# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "1642507082";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "4df4e9360975a8be6e7a7270466fedfd1adcc5b6";
      sha256 = "0CkM5JdSroilHkOIO/roLnrBbBjcPxe6AR1eqifJUSA=";
    };
    meta.homepage = "https://github.com/lewis6991/impatient.nvim";
  };
  FixCursorHold-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FixCursorHold.nvim";
    version = "1635853855";
    src = pkgs.fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "0e4e22d21975da60b0fd2d302285b3b603f9f71e";
      sha256 = "v56qtPGa8MkEPpQpzA+XHH/TsV1q4p65wSuvF140LuM=";
    };
    meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim";
  };
  vim-auto-cursorline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-auto-cursorline";
    version = "1584263271";
    src = pkgs.fetchFromGitHub {
      owner = "delphinus";
      repo = "vim-auto-cursorline";
      rev = "ee22b1589809f1b1aaaaef15997a0a84585d667f";
      sha256 = "+ajtZm9pJrl49fI7zFqBJ49SL1XqfOoTp0ICelEknYc=";
    };
    meta.homepage = "https://github.com/delphinus/vim-auto-cursorline";
  };
  which-key-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "which-key.nvim";
    version = "1642619077";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "28d2bd129575b5e9ebddd88506601290bb2bb221";
      sha256 = "bz41c/zenRVVIkwtHHIi8wF/LZn2JEkFc6tkPv/BYY4=";
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
    };
    meta.homepage = "https://github.com/svermeulen/vim-subversive";
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "1643281801";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a219971291c56bcca3827cb7bd40aaaef23feeca";
      sha256 = "r1VhURChdutQFO9fiF+YV+MJycuj6xohTmR9DYpUFdk=";
    };
    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "1643397445";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "d91d94aa9f55631855efb46a2b4a459a4a1439a0";
      sha256 = "VwwKIQgUEfKGOtPylxuPn3m/XsCyNbf+fpaeMp5psjY=";
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter";
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "1631739633";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "787a7a8d4444e58467d6b3d4b88a497e7d494643";
      sha256 = "YMINv064VzuzZLuQNY6HN3oCZvYjNQi6IMliQPTijfg=";
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
    };
    meta.homepage = "https://github.com/martinda/Jenkinsfile-vim-syntax";
  };
  popup-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "popup.nvim";
    version = "1637254091";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
      sha256 = "dNWz/xovUg55fDZUpVs/2kLphk3lqQyvPtc9ATwbeSQ=";
    };
    meta.homepage = "https://github.com/nvim-lua/popup.nvim";
  };
  plenary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "1641403390";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "563d9f6d083f0514548f2ac4ad1888326d0a1c66";
      sha256 = "mHcBRO9zJGyeSMBYEPUk6nejwhj9Yy5UF4Wq7EyRmsQ=";
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "1643384202";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "3a3c9a3c8ba3fb14121ef5c50a87173dcb969416";
      sha256 = "lDyeYKQBTEwYcot7/zO1vUGSg9dGAmkBZPUQL2Sf8YQ=";
    };
    meta.homepage = "https://github.com/nvim-telescope/telescope.nvim";
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "1637772424";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "b8662b076175e75e6497c59f3e2799b879d7b954";
      sha256 = "gd/nNgMhvHdJWOlHMdYxY8Hi8Qo4F66TjKSewNKNR3I=";
    };
    buildPhase = "make";
    meta.homepage = "https://github.com/nvim-telescope/telescope-fzf-native.nvim";
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "1642582804";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "cef52b8da07648b750d7f1e8fb93f12cb9482988";
      sha256 = "BrseGCUZV689EbeLAme2PBeWOerwDV3lGaRTihS4l+M=";
    };
    meta.homepage = "https://github.com/ahmedkhalf/project.nvim";
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "1643068332";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "c51096481dc13193991571b7132740d762902355";
      sha256 = "tY04QqUUe4um1cPy8mejHgC9oXga9uXq+N84k8XF9wk=";
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  null-ls-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "null-ls.nvim";
    version = "1643322091";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "2ae4a5e2e2b35716c44c104ef1afa35ecb40c444";
      sha256 = "55NdHFFmuyoU0ELNnYXvhPGH1iVhyaXkm3zgkNmwO/g=";
    };
    meta.homepage = "https://github.com/jose-elias-alvarez/null-ls.nvim";
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "1642530817";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "634e26818f2bea9161b7efa76735746838971824";
      sha256 = "3zigwYJrw3gocsF2WqHMBS4cFkTyj78StiSP3o9S0N0=";
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons";
  };
  trouble-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "trouble.nvim";
    version = "1640940059";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "trouble.nvim";
      rev = "20469be985143d024c460d95326ebeff9971d714";
      sha256 = "t6zNugUO75TxOs4T83H8Slr04m3Dv113p/M/4XPg4QE=";
    };
    meta.homepage = "https://github.com/folke/trouble.nvim";
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind-nvim";
    version = "1640888751";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "f0d1552890e384f15b47ea88bd1b8a077cddc24a";
      sha256 = "oAA4Q4FC+7fbBw8CwGrqP05PD+q5035vurYzMQLk03I=";
    };
    meta.homepage = "https://github.com/onsails/lspkind-nvim";
  };
  lsp-status-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lsp-status.nvim";
    version = "1638992828";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "4073f766f1303fb602802075e558fe43e382cc92";
      sha256 = "5K7AtqAAiuma1bHba2ijbfHKWr9r7Dxd8BfGU2zxLKo=";
    };
    meta.homepage = "https://github.com/nvim-lua/lsp-status.nvim";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "1643095641";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "d93104244c3834fbd8f3dd01da9729920e0b5fe7";
      sha256 = "wF1LDVSozWZOGL9J01/rRVdx2JsTpaaKHxMufG+pxL4=";
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
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp";
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "1642243088";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "47901e7ccb72cb6d2156af9bac338387f49d5a1e";
      sha256 = "iFBTCajuKNxCsiqwUjKWeNOznxEvtOJcfcxwagM1Zss=";
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1643400059";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "35322c97b041542f95c85e87a8215892ea4137d5";
      sha256 = "PCp+akGP2zzHd1eQBidEbSrz8Jbib5muuYp4qLTs3iw=";
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
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lua";
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "1642430705";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "c5230cb439df9547294678d0f1c1465ad7989e5f";
      sha256 = "qKPYOW+Nid3CdFJfeU1JVb9zaDZAk2F/WQ4ddjNDRnk=";
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-path";
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "1641254550";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "f83773e2f433a923997c5faad7ea689ec24d1785";
      sha256 = "LXNckOkSqRMFWJhBaPUm8el0SgTS2XPvg3N8CEwHLHw=";
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
    };
    meta.homepage = "https://github.com/ray-x/cmp-treesitter";
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "1638355837";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "29ca81a6f0f288e6311b3377d9d9684d22eac2ec";
      sha256 = "BkMvtwkLnT0tnLn9F+vt3vtmAQOBVFwFC3YF7ZsE8Hs=";
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
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol";
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "1642167318";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "97e454ce9b1371373105716d196c1017394bc947";
      sha256 = "XP/HQ8jhgkrTVEmkFZz4CqwjSjAvl561XMMQDVnOtuE=";
    };
    meta.homepage = "https://github.com/windwp/nvim-autopairs";
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "1641285774";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "32bc46ee8b21f88f87d97b976ae6674595b311b5";
      sha256 = "L5fq4hHRkt2aouEV2MyPYGFlnfiCN1lZHm8UdfKkWLU=";
    };
    meta.homepage = "https://github.com/windwp/nvim-ts-autotag";
  };
  Comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "Comment.nvim";
    version = "1643173013";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "7365bfe9fc6dc004cc97b8977aa8129999d81bf5";
      sha256 = "FFR8xA+w6xS91ulsas3TldEOsakaoCu7HdcYK9ppF5g=";
    };
    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "1643238217";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "f107174097df7ec29dfeb573ebc2ede8a1f0a067";
      sha256 = "WPa1HXnDE9zwX70HSx4LRwsw1dOqWCfz08rNQhBk3KI=";
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  surround-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "surround.nvim";
    version = "1643376800";
    src = pkgs.fetchFromGitHub {
      owner = "blackCauldron7";
      repo = "surround.nvim";
      rev = "3d5ae1ecd8a29a513895d5bd34723623702a03b0";
      sha256 = "ZUdBK1Cmf3Ab78pGZriAeyHYUTB5tvQYVcPkDAslcmc=";
    };
    meta.homepage = "https://github.com/blackCauldron7/surround.nvim";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "1643247497";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "07196cfb15070cb8f7f71f8ef4dfbebfc5e83304";
      sha256 = "QGJtkRi2+RpApRLXJYPkvs0ypwwmqg87Tw/Mg3e13fw=";
    };
    meta.homepage = "https://github.com/andymass/vim-matchup";
  };
  undotree = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "undotree";
    version = "1640333528";
    src = pkgs.fetchFromGitHub {
      owner = "mbbill";
      repo = "undotree";
      rev = "c4984fc6dcc6c4e190f2f8cd5fffb65b0aaa51d2";
      sha256 = "3x01yjy4j7y/SjsUxnI2xOGQxo7GdZsCsBQyqOhK6pk=";
    };
    meta.homepage = "https://github.com/mbbill/undotree";
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "1643042185";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "9208bae98fd5d1ab6145868a8c48bfee53c1a499";
      sha256 = "XNnlSVVt8HswN2PLaMhHIOQ9I9LMaPwkEqGlQ8eb5Lc=";
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1642342787";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "7451dfc97d28e6783dbeb1cdcff12619a9323c98";
      sha256 = "SMnRtdmqOJdR+7/TFylBxLwmUG3ftjyEOW/QaDrhHHA=";
    };
    meta.homepage = "https://github.com/akinsho/bufferline.nvim";
  };
  nvim-tree-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "1642778029";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "2dfed89af7724f9e71d2fdbe3cde791a93e9b9e0";
      sha256 = "7P63ixnOMhUdEP2JfXz7HxE6Z5c8Wm8tQw0iPLRhgqA=";
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "1642829036";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "2e35f7dcdc72f39b37c21e43cdb538d7a41c7e07";
      sha256 = "ik7GDbctby+fzk+TX2A3NQNN7zq2smOxDcEeWsc88sE=";
    };
    meta.homepage = "https://github.com/lukas-reineke/indent-blankline.nvim";
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "1642829224";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "fe3cff94710d648c57ac826fb846014903c76b00";
      sha256 = "TPPhmI9P8upm2RBhx5k0n6hXIgwSsfBIZMNMGQEKq1Q=";
    };
    meta.homepage = "https://github.com/lukas-reineke/virt-column.nvim";
  };
  nvim-colorizer-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-colorizer.lua";
    version = "1591879145";
    src = pkgs.fetchFromGitHub {
      owner = "norcalli";
      repo = "nvim-colorizer.lua";
      rev = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6";
      sha256 = "6YrnItxExL2C8pNIdLd+hXCjsB2MbZANwWkah6dreD8=";
    };
    meta.homepage = "https://github.com/norcalli/nvim-colorizer.lua";
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "1643220138";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "4a2d30f5fb77750c7a42be9bb58a9cc2c6c7f31d";
      sha256 = "W90CQQcQwvgCVlOPCI7Kz1yXgjyQwgmFWGKa/Z4tIHA=";
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "1643372092";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "db761f656f06ea07323b997b0af358a73ba7f74d";
      sha256 = "k6W+T4Q+CK7VprWFsRYnvSmrA88E9yOdrBiQ4OPHl3g=";
    };
    meta.homepage = "https://github.com/lewis6991/spellsitter.nvim";
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "1640886528";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "15f52efacd169ea26b0f4070451d3ea53f98cd5a";
      sha256 = "UD4rR9R/gUbMzXZ5AAfj5TmoUoF7wjpqJYWZX9dkrcc=";
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
    };
    meta.homepage = "https://github.com/LumaKernel/nvim-visual-eof.lua";
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "1642116587";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "db98338285574265a6ce54370b54d9f939e091bb";
      sha256 = "QnrzzbWonGsnXCXhHmMLqf3LeDw67D6UtGcn9Ytu0MY=";
    };
    meta.homepage = "https://github.com/RRethy/vim-illuminate";
  };
  FTerm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FTerm.nvim";
    version = "1641276048";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "FTerm.nvim";
      rev = "eabb65f23ba48ec9e8abb9a2514f99b77b3bc6f2";
      sha256 = "xoah6q7GKXyt8UhwuhDL8MVpC0ln1e2L1J6gEhOkYS4=";
    };
    meta.homepage = "https://github.com/numToStr/FTerm.nvim";
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "1642601933";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "98b1ebf198836bdc226c0562b9f906584e6c400e";
      sha256 = "8uj5TxO9XZlSCB4lVRbKRc1IlUEKcBf/4bDviwuxEgs=";
    };
    meta.homepage = "https://github.com/folke/todo-comments.nvim";
  };
  editorconfig-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "editorconfig-vim";
    version = "1642820146";
    src = pkgs.fetchFromGitHub {
      owner = "editorconfig";
      repo = "editorconfig-vim";
      rev = "a8e3e66deefb6122f476c27cee505aaae93f7109";
      sha256 = "qFLXqhV+ZVhxoq+QoxWSDUrg8W/+qChJuCd4hSJqy28=";
    };
    meta.homepage = "https://github.com/editorconfig/editorconfig-vim";
  };
}
