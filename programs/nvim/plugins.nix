# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "1640506679";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "3ea9abedb6941995b05fdad654d9cfd51c38a31f";
      sha256 = "M33tmUHmwM2ukAsJzD5QSSh4Ewl9z6vg7jLzc96AaBk=";
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
    version = "1641261425";
    src = pkgs.fetchFromGitHub {
      owner = "zeertzjq";
      repo = "which-key.nvim";
      rev = "7815ae48927420f49e3826ae4c98d2d467c9fe7f";
      sha256 = "vumqkTgHN6PJgeiyq9oFqm4uw2NUzzu6/1pHS/uxH/0=";
    };
    meta.homepage = "https://github.com/zeertzjq/which-key.nvim";
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
    version = "1590213910";
    src = pkgs.fetchFromGitHub {
      owner = "svermeulen";
      repo = "vim-subversive";
      rev = "5695f97fc803767bf657a5e512daec19dd1fd786";
      sha256 = "+OIkKMwZsW6h5LCkI1mBspFUkCtqIX5RXdiLN+bbelI=";
    };
    meta.homepage = "https://github.com/svermeulen/vim-subversive";
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "1641308668";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "2a042d9a950d740e5d69640c2100affbe6c694ea";
      sha256 = "XRCIFtXSzjIr1E72cfCV2YDhWPI6aagJiEK/UzhFV6o=";
    };
    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "1641414116";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "0a7b098b8e973fb62a6dee1ea005ca74c0b04bb4";
      sha256 = "6runyYxwbbchmBqIt20BW3VFoQA2NLyh6MeAMGGee5I=";
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
    version = "1641195699";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "a01ebd2793999c11d727fd15b1e5979ba20c7503";
      sha256 = "aMRVy4+RW2deursZHe8E2vAIfeeaIJFGf6bpnUe2Q/Y=";
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
    version = "1636215460";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "71d0e23dcfc43cfd6bb2a97dc5a7de1ab47a6538";
      sha256 = "RUPbmMPfa1lT2fIslC9vZR3e23IkOyPpYnWDytxkvUs=";
    };
    meta.homepage = "https://github.com/ahmedkhalf/project.nvim";
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "1641410359";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "9a122f640c4ae2610c9834327cbf6d1175a95712";
      sha256 = "pNeuTGjIh3iwsOsteFfE4yQj9qT+/IhmZq+efSj+xOU=";
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  null-ls-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "null-ls.nvim";
    version = "1641350250";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "b75effe6cb304e97901289f3f2e8d2ba77c7b752";
      sha256 = "4+vxBKaXmEYJ6tQT4WC+dVcVDJbeEpUKR7BJqJM0Xgk=";
    };
    meta.homepage = "https://github.com/jose-elias-alvarez/null-ls.nvim";
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "1640033101";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "ac71ca88b1136e1ecb2aefef4948130f31aa40d1";
      sha256 = "DWbUhVTIhKYw+39rEHxUhDE7hRm3CtYMzfRDFj0j9Lk=";
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
    version = "1641095082";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "1b94aacada96d2a33fef2ecf87748b27a2f50630";
      sha256 = "G9K+drH+atN0h/1Xuzg+JzP0nnZht5ogS0LFrHVc9kU=";
    };
    meta.homepage = "https://github.com/hrsh7th/nvim-cmp";
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "1641318246";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "b4251f0fca1daeb6db5d60a23ca81507acf858c2";
      sha256 = "xrtqZGKT0MjapdlWooAFGUyfiDMdqmJ/mB4LA1YuX2E=";
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp";
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "1638538406";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "daa6a0c2484915e855e60eeff586860c68e59d83";
      sha256 = "oNOZ3UxQA55SIg5cDR9Ot2lAr8fdth1+KUMj+AZumko=";
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1641135061";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "ed0140696fa99ea072bc485c87d22a396c477db3";
      sha256 = "jzjwYHKLU2J7eNm4I7YIuJG7jDFO6uCbl8dk4tLbTAs=";
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
    version = "1640869280";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "4d58224e315426e5ac4c5b218ca86cab85f80c79";
      sha256 = "d82E/Vl4a/WGAVKWuPYXjZO/jVo+7aKp05JaRoA6dgU=";
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
    version = "1641264234";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "96858723f1cba6a3eb004373a20c315d90584ea6";
      sha256 = "voOrTHMJ1YY22gNWABw+MSbUwIFzyZdVe92lxptw9Yc=";
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
    version = "1641127882";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "90df2f87c0b17193d073d1f72cea2e528e5b162d";
      sha256 = "Xl8lF3GMHdOfMe0TmIWWWCYPMlHnRZSruuTkfX5lNf8=";
    };
    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "1640204071";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "6ee11ac62681eb2eb8104a4ce509a9a861672cb5";
      sha256 = "dIMlqMm/XzfWAIAH/KkzLCYZLAIYdtPGdERJShry6kE=";
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  surround-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "surround.nvim";
    version = "1640812764";
    src = pkgs.fetchFromGitHub {
      owner = "blackCauldron7";
      repo = "surround.nvim";
      rev = "81f997bd71590f21f717e24bae72edf8e8b7b0f6";
      sha256 = "xZB2n8gdqYWTQAmSDJfn96bzvZ5pnTuihyd8oeZdrRo=";
    };
    meta.homepage = "https://github.com/blackCauldron7/surround.nvim";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "1640986521";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "85c65f4594bb9689d4078df9913498837a02edf5";
      sha256 = "o7Go8LV6Az8mE2KC/wBR9pcvpDxN8qly3BfRtNGn15c=";
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
    version = "1641317431";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "52725d2ca87c38e3cf479993afcbdd36e5c81a26";
      sha256 = "lA6Ik2w5h6pu6a13p3jrZr/EoV2yIKAOWfIrlFXzCEw=";
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1641128919";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "17efb4c834daf4eea96f18753541485ed05baa6e";
      sha256 = "rOqfhaEevZ0a8bLm9p4hjx/WlO1tpPL7eenZ4hBtp3I=";
    };
    meta.homepage = "https://github.com/akinsho/bufferline.nvim";
  };
  nvim-tree-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "1640353820";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "0a2f6b0b6ba558a88c77a6b262af647760e6eca8";
      sha256 = "gKKjupu0Myz2Sgh/7SBJPi7tk+yn11+fJDbSPlWzfWs=";
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "1638347592";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "0f8df7e43f0cae4c44e0e8383436ad602f333419";
      sha256 = "8sELQ8TY3DN9V+pG6Li0wXb5/xe5uhPymL/JSAplWI4=";
    };
    meta.homepage = "https://github.com/lukas-reineke/indent-blankline.nvim";
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "1641395205";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "52124c8bd097d7e2f00dbfa862372bf148459483";
      sha256 = "KiIyhGi0D3B9IrzgNKmOvBfFyIbv3YDabZTn4G1m6jo=";
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
    version = "1640865250";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "c18fc65c77abf95ac2e7783b9e7455a7a2fab26c";
      sha256 = "MEngtIaIHRYBgBrS5GLPQohLUn77TnIXw8xHbN1PqNw=";
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "1640728497";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "3458915f9cccc7a4c95f272793790628fcd49bf7";
      sha256 = "Tedv5x35MuLftWg0q8bYMM7Jhw7dMImeFP90IfdfJuY=";
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
    version = "1640103375";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "8e68a8c75eee7fbfb5e94d779979fa41713ec8b2";
      sha256 = "sqFb9fYddtDcPx+eFkrq83UObCi1OZKlF7ZeVeQL9IE=";
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
    version = "1639214028";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "672cd22bd15928434374ac52d0cf38dd250231df";
      sha256 = "16damc7E0J9dXTIe4pSWrbPoobZDRh1FQ1XyFzJvnoE=";
    };
    meta.homepage = "https://github.com/folke/todo-comments.nvim";
  };
  editorconfig-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "editorconfig-vim";
    version = "1627199038";
    src = pkgs.fetchFromGitHub {
      owner = "editorconfig";
      repo = "editorconfig-vim";
      rev = "3078cd10b28904e57d878c0d0dab42aa0a9fdc89";
      sha256 = "HFHrm+V296IJh27yJW76DD09ehYc8hMxnnvR9+ddP2M=";
    };
    meta.homepage = "https://github.com/editorconfig/editorconfig-vim";
  };
}
