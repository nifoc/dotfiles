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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/delphinus/vim-auto-cursorline";
  };
  which-key-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "which-key.nvim";
    version = "1639755215";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "312c386ee0eafc925c27869d2be9c11ebdb807eb";
      sha256 = "T9Chtv1ITHItYGKFu+bIufzTmckEGsiqO8peuI7KtGw=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/svermeulen/vim-subversive";
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "1640080225";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "75c5266caad0fe4de68f5a26fb522f0886a897b1";
      sha256 = "AY/mznFdkHq/3ic5RJ6ByEMeQ3tkTs0pIaZyqk50ZmM=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "1640374559";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "ad69e2528ac382b7cbf28f1ac7ee450981734ab0";
      sha256 = "RmxYJFh0/Irdhaf9mTBK22CRyIZIiYZ3jwv0Z5ZgchM=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lua/popup.nvim";
  };
  plenary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "1639589603";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "a672e11c816d4a91ef01253ba1a2567d20e08e55";
      sha256 = "OwgssngbEgOlS7AfXfeRXIAN/3ZgdVEvu/X0SdnVH88=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "1639936550";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "9aaaa0c5f3eb665b51bbcafda084de4b0952fef0";
      sha256 = "HXitazIvM9vlaw0ABXQQQVotrbNsoAIBzg8ctocp9Ik=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/ahmedkhalf/project.nvim";
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "1640534320";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "1aa05163361331e881c6130781c01d93b63f9232";
      sha256 = "9H0qbyTrYOZlOO1cy5dHjtY1ghrCVOKuIJ9+bFgCp2o=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  null-ls-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "null-ls.nvim";
    version = "1640196772";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "b7de45a0e62bf93f19db2b43ecded48c5763248d";
      sha256 = "9S1IPl58ZBjLqbChVYM92l7Mz1Cg3U9ex5ImFebDuxY=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons";
  };
  trouble-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "trouble.nvim";
    version = "1639606855";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "trouble.nvim";
      rev = "aae12e7b23b3a2b8337ec5b1d6b7b4317aa3929b";
      sha256 = "6oCmwQJi7Jdwt1fuXZjBwJXfV5TImrCGAeI8VZa/jIM=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/folke/trouble.nvim";
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind-nvim";
    version = "1638754302";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "f3b5efa11f0665accb7bd0258260b9d08dd4956e";
      sha256 = "qIs65OIV0m5Y3pe5ozG6sYa1yIx0vXpkNC0Gkkm9amw=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lua/lsp-status.nvim";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "1640498235";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "ae708ef3a44dfb0cb42d1aa901b4c57c2de53aa3";
      sha256 = "zxI1gr2pUvWROoIb1psI46YiM0n7GUwq9jBM5YF2Yeg=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/nvim-cmp";
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "1636543770";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "134117299ff9e34adde30a735cd8ca9cf8f3db81";
      sha256 = "jLfW4xoYnEOWa7oWSmkB7vNxu9Jgttbme+nTiAC92so=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1640472785";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "2cf01631ea47ae10ddd75076ab0b26b5859cfd84";
      sha256 = "uaeeYCwPjvw7WGv18jqbNboTVwuoO1NgC9Qb+Wj2ctY=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/L3MON4D3/LuaSnip";
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "1639307886";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "7bd2612533db6863381193df83f9934b373b21e1";
      sha256 = "lVTeY8PKvKYUWnjwfSK/m2950mqGqaxN1Z/YzUWM9Ks=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lua";
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "1639986819";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "81d88dfcafe26cc0cc856fc66f4677b20e6a9ffc";
      sha256 = "h7/0UNmYSsFIiU4eBMDOqujsuo61CPvC2nv1pfbnA7c=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-path";
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "1640356244";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "a01cfeca70594f505b2f086501e90fb6c2f2aaaa";
      sha256 = "KktOSIkxZnES2duuc0pMOkMIm+jnnRVkzuP5icRmUWM=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol";
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "1640505838";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "a9b6b98de3bacacc0c986d9b0673cae6a87c4a41";
      sha256 = "WpqCTMPEUR9p5bAnRlZSOVLAqtxNJXuVf+hRGakeftI=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/windwp/nvim-autopairs";
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "1639950366";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "0ceb4ef342bf1fdbb082ad4fa1fcfd0f864e1cba";
      sha256 = "5410HeSpgID+Nf/5Yowxgw9yUl9nkI+EM5sD+6yEci0=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/windwp/nvim-ts-autotag";
  };
  Comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "Comment.nvim";
    version = "1640084775";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "9e80d5146013275277238c89bbcaf4164f4e5140";
      sha256 = "WeZN75fsiDpDQop7M96r93IAk9X5tKFTEi1TRbi2sd8=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  surround-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "surround.nvim";
    version = "1639635030";
    src = pkgs.fetchFromGitHub {
      owner = "blackCauldron7";
      repo = "surround.nvim";
      rev = "59a0ef7d7f8da05f9e03075186b6de754e85c42c";
      sha256 = "5Tx+eUmgSS+Ye5nEbuUroW6HXsvT28owMn9uPBW5+8M=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/blackCauldron7/surround.nvim";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "1638237820";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "ef044ee012baa01d6f4ad79a04eeb5edb5bc7d84";
      sha256 = "HhNvaiVYR8sI4UItJVZDYodZjQYmV1ZJ0NmMDiN5DqY=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/mbbill/undotree";
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "1640427219";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "9e26823ea6c7361aba3253c8a5c56a6f35b4a0ee";
      sha256 = "6uY4MyYwKjkKZ0mFQngZjCBRd5KL3ZY5wXxjRXHhekY=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1639579068";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "de66766716ab29414c7dd078d16b4773ab53a0bd";
      sha256 = "nQVqcnn5R4bicqrohsTVcUeY556965eL/DVQ6UmnPSo=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lukas-reineke/indent-blankline.nvim";
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "1638327947";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "7b013a2c873df8e1ec9412532b5ac7592d35a61d";
      sha256 = "CmexkPZnguQc0597h1jWIgxrrUOOevQV7TXsLKSveIE=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/norcalli/nvim-colorizer.lua";
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "1639400161";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "a451f97117bd1ede582a6b9db61c387c48d880b6";
      sha256 = "Uzk0oapIcflO/MUpISm9MkWz091soRCV3n7BOW3MEgo=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "1639870357";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "d2e280aa3a3e239b12e24d96863d48744a76d764";
      sha256 = "WDK1d2LzKBMy6rTx0L4hgn2RvEYKvFxm0X8nnY4FyyE=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lewis6991/spellsitter.nvim";
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "1639646693";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "243811198d3a937be03535bbe899446f235dda75";
      sha256 = "R54ebmQTrTTxzIgPksnzFgXPhh7jEZsyqVXdS1WkO7A=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/RRethy/vim-illuminate";
  };
  FTerm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FTerm.nvim";
    version = "1636811867";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "FTerm.nvim";
      rev = "0911ab93b488fdd8032e695ab56d14357e14e836";
      sha256 = "MThp2SSzDbK3edKfOtnAHy2NCkuLQs3FCs6h5ox5bl0=";
      fetchSubmodules = false;
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
      fetchSubmodules = false;
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
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/editorconfig/editorconfig-vim";
  };
}
