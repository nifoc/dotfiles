# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "1648714532";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "2337df7d778e17a58d8709f651653b9039946d8d";
      sha256 = "F7axsGpZoSREVu6BqXSWsvemN5pUe6e5cIFG3DQO/xk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/impatient.nvim";
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
    version = "1648623396";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "cbaeb9fffc14e7e5687715987a94b4f410084560";
      sha256 = "DkIyoh4sM3IrtyVuHUMKPetOS75z8Z38ebUBg0laHvU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "1647975972";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "09e62319974d7d7ec7e53b974724f7942470ef78";
      sha256 = "mOvTXbJ2uQseNuQfdTrUuFHWRg2ia9yXld+4WiBVxDg=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons";
  };
  which-key-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "which-key.nvim";
    version = "1647590687";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "a3c19ec5754debb7bf38a8404e36a9287b282430";
      sha256 = "KvzS9Lzkw09s0TRmHLN/CLjXvietGJzI06W7WNChcwI=";
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
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "1648801356";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "df770841885f22d4cc7265fa74290c5afe371591";
      sha256 = "6cKVGt8Z9d6IuPVRaGwSwp3hoWVDilAIketNDi8767w=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/ggandor/leap.nvim";
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
    version = "1648825746";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "aadad4738e8453b3b0928ba0aa8f49b6878abace";
      sha256 = "DGNsmVYdGf9yvyYZgwpjSxxLnvVrEDMdF6uBz0I8HwM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter";
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "1648628752";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "7dbcd4d647010a80d135804b3fc1da3fb77083d6";
      sha256 = "x6NKZNJzGDnpMI97ChhG+DBJPUwLMWjXyhmAugXH+Tw=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/playground";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "1648744958";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "d38ad438f3bb4e3721b9964172c8c9d70d5d06a8";
      sha256 = "RVkh+BMiDPpY+o6Ao9KAO6AXB77hHEHJMLNLWj5dmSE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-telescope/telescope.nvim";
  };
  telescope-zf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-zf-native.nvim";
    version = "1647372635";
    src = pkgs.fetchFromGitHub {
      owner = "natecraddock";
      repo = "telescope-zf-native.nvim";
      rev = "3f64df2cb1e8c4a399154b21dabb2734a1afb8f1";
      sha256 = "pO8EK7CiLZqPS8YDdxpGy24mDd8QYCTaBh2SPqnS1YU=";
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
  telescope-ui-select-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-ui-select.nvim";
    version = "1647808851";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "186a124a01d7f19e6fcf608d4e1cc61d61ebe939";
      sha256 = "65/SEDm1HZ4iuEFJMOILUlMLY2Sq7zXW2os9UEkLodM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-telescope/telescope-ui-select.nvim";
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
    version = "1648480371";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "3d1baa811b351078e5711be1a1158e33b074be9e";
      sha256 = "If8vjLISzCC6qo7iorhgrX5fC6Q/p+a8qvUbrvaA4BA=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  null-ls-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "null-ls.nvim";
    version = "1648575967";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "0292b2283f6fdf6cd4f954219f97b1ab7d6df5a5";
      sha256 = "yMit+SS1So6ozranmdwuqyZhjLrhkVZ2VACspt+H8P4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/jose-elias-alvarez/null-ls.nvim";
  };
  trouble-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "trouble.nvim";
    version = "1647585739";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "trouble.nvim";
      rev = "691d490cc4eadc430d226fa7d77aaa84e2e0a125";
      sha256 = "oUf8YbJ9HmSLN8o2c7CXzCYPu7PwKzvVKNiM9HtHQbQ=";
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
    version = "1647533682";
    src = pkgs.fetchFromGitHub {
      owner = "jubnzv";
      repo = "virtual-types.nvim";
      rev = "31da847fa54b801f309a08123935626adda4aaad";
      sha256 = "Qvzfsm0fyLwLc2VNCQsWZjLP+GEzeNrDd8SARnsSD08=";
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
    version = "1647200963";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "487563de7ed6195fd46da178cb38dc1ff110c1ce";
      sha256 = "OqmW38YUWiTD9wcjmMnQNksWnLueeyRQz+zi/gL+l8w=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/RRethy/vim-illuminate";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "1648830769";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "7dbe34e36d9de4912a5f3aa5279540445765814c";
      sha256 = "7qsLuko9Jeipqv30y2brTFjzFnZSXaMSHShgY08Nv2w=";
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
    version = "1648526692";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "8014f6d120f72fe0a135025c4d41e3fe41fd411b";
      sha256 = "SdB4pjV3om2J6hSBecTLomq7QxguY1mEgSKAWxNXwcw=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1648820436";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "eb5b77e7927e4b28800b4f40c5507d6396b7eeaf";
      sha256 = "C01ls/H/uuycWmNk8RPyL1xLeptJSyELznoyMVPLUg4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/L3MON4D3/LuaSnip";
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "1648846007";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "b10829736542e7cc9291e60bab134df1273165c9";
      sha256 = "1JiDa7fK9AEMUxLOFD3SSsxKEVLfd5xR8vfUlLRqz+M=";
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
    version = "1647917976";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "c3f0086ed9882e52e0ae38dd5afa915f69054941";
      sha256 = "NASM5mm4DjLNupVTnhj7rQR8gx0cNrF8vzMg8A1a+co=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol";
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "1648179861";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "f3ebca37d6ef1ff22d1f2c764a9e619d1fe5f3c7";
      sha256 = "4bNdIigt79vahqiuA4yn4gMSB4GHeMIjnGD8WIrUvXA=";
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
    version = "1648789182";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "546c4875145d5a9216f4a67e5a4dc8d03d7e42bc";
      sha256 = "Xlo3XcwERze2QViasvnNUY9sWkwUjBlpY4uXSAhI1Xk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "1648520193";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "c4b41e42dad700b23c6ea86ecb69c9deb55a8fbb";
      sha256 = "7G9vmmO3N0J7WdnSR3nwXt1xnEbj+kqv2i76nYNdDtE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
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
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "1648799169";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "c8e5a69085e89c2bac6bd01c74fcb98f9ffa5cdc";
      sha256 = "dbFLK65ln2J4Mt8vu8UkMZqQpkD5r7DeRRK8PsPnTiw=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1648834632";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "004cd5734fb21e39d48c1fb1469fa63e2797880b";
      sha256 = "EMP7zqZH/E19OPQHoEZVz1rWhluqu5GAnybPW4lNJuc=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/akinsho/bufferline.nvim";
  };
  nvim-tree-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "1648575771";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "5958fd5d068877fbf3d083abff03dccb4d8286a1";
      sha256 = "JHw+G2kAKpxSmsmhN4RXQKKPhAsXfeYNugnEHGsQbIQ=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "1648432344";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "9920ceb79bffd0e6b7064be63439e38da0741d03";
      sha256 = "HZVbLOZ/eKt2bp0QtNg25szuV2/yw3ZiCRwlKU6zmJc=";
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
    version = "1647890579";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "9987421e0724ce704d0035f50a7080c677a85d71";
      sha256 = "rtIFaAFYj77Qd5BJptozIwCcD2gazqLh8iQRNGBcS5M=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/TimUntersberger/neogit";
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "1648714754";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "9c0fb1a1c7c2770b8fe6cd923cc4d173972cff0b";
      sha256 = "wIPgSwFsTM3LnHGrzop5k3jSpApUOaw0qMVGz+Qs56k=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "1648571721";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "f84e7a31c516f2a9cb857a02e4b551b009a81afb";
      sha256 = "lYyTA9hvxljNy0n3xZCCwC1e+W1mBBwdGDKXiWY1x4E=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/lewis6991/spellsitter.nvim";
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "1647766037";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "da1030208347ad8937fdad1d4f8092b578e3ea2f";
      sha256 = "Csbe54tl808Fa8SRdJzzYIgEoYqKtuqPc8yCE0xl2Vc=";
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
    version = "1647158214";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "FTerm.nvim";
      rev = "233633a5f6fe8398187a4eba93eba0828ef3d5f3";
      sha256 = "6IZpKDw0pdBbWnCk4H7KuKcIWTwfH+NyJSr2IFKMtms=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/numToStr/FTerm.nvim";
  };
}
