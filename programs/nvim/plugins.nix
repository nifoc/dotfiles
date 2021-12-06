# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "282b99b";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "282b99b817d61e6c6860addf5629b641925a937a";
      sha256 = "RtXtmtfpPAtZuDSn/eKaX12w1BybqUeWoKVGV2yEMCM=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lewis6991/impatient.nvim";
  };
  FixCursorHold-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FixCursorHold.nvim";
    version = "0e4e22d";
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
    version = "ee22b15";
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
    version = "d3032b6";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "d3032b6d3e0adb667975170f626cb693bfc66baa";
      sha256 = "mgLmwP8ci9VjRiwBedZDPXi6CjNtJy3iOJDbmSXtisk=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/folke/which-key.nvim";
  };
  tokyonight-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "tokyonight.nvim";
    version = "b3a829d";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "b3a829d2ba6344b5364fda71b5b7501f707d1bdf";
      sha256 = "n00mEFtTbN8XAmlOcjtToagaUqROJ8Id4E4kAPXpEVk=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/folke/tokyonight.nvim";
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "aa9d195";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "aa9d195ab856b1c8e9d3afca0768cdc2d992a4a7";
      sha256 = "qRwhrXwpcasr8JC2W7oBiKLsywUzYgSDL8n9rAeQWkk=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "d6a0a26";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "d6a0a26b8563409d4660def7320a4f4bc23954df";
      sha256 = "WqTxPlN39/IoDh7/nWbY+yArkkDYD8IRADhSt0X0yZs=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter";
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "787a7a8";
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
    version = "0d05729";
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
    version = "b7404d3";
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
    version = "5d4a65a";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "5d4a65a84d2eb2ee035c667d01ef8e7cafb8a549";
      sha256 = "ctluRYRvuOR/LmRmtQoztY1BuOezU1zdTlKrARuN/J0=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "82e3cc3";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "82e3cc322ad87b262aef092cb7475e769740e83a";
      sha256 = "72Ff7d4f7EHRG9+r/U9BV5XbN1vMkyVoZcfrZ6uVQuA=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-telescope/telescope.nvim";
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "b8662b0";
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
    version = "71d0e23";
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
    version = "22b21bc";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "22b21bc000a8320675ea10f4f50f1bbd48d09ff2";
      sha256 = "9SrA6rsrpjVZC2OuEaC1faYXqpT8rrDsZ4Sqz60D7Y4=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "8df4988";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "8df4988ecf8599fc1f8f387bbf2eae790e4c5ffb";
      sha256 = "a6vlRuNAa5oJy5AFp0SjqNUwSE/kc8jaII7T9IcG+Kw=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-web-devicons";
  };
  lsp-trouble-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lsp-trouble.nvim";
    version = "4a45782";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "lsp-trouble.nvim";
      rev = "4a45782db943f95500b61ffce187bf4cada954ae";
      sha256 = "qkJkMPxmUVytymwgXI8BW3OPMZcGRT9pSA4LzXhOlZg=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/folke/lsp-trouble.nvim";
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind-nvim";
    version = "f3b5efa";
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
    version = "e8e5303";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "e8e5303f9ee3d8dc327c97891eaa1257ba5d4eee";
      sha256 = "otDFYc9Sl1OYmkrWFCzgAG0XkXyvR/ebRe2zAOwQ1IA=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lua/lsp-status.nvim";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "edc2a50";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "edc2a503ee33e2a62e94a2257e9e3bbd50fa6feb";
      sha256 = "5/ZvonFG65i+bBKAdlgD0+zI87BgIaEGFwocsPkbmS0=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/nvim-cmp";
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "1341172";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "134117299ff9e34adde30a735cd8ca9cf8f3db81";
      sha256 = "jLfW4xoYnEOWa7oWSmkB7vNxu9Jgttbme+nTiAC92so=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-nvim-lsp";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "0528072";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "052807223ba4d9babb412f12f08da0b34bc083cf";
      sha256 = "rA6c/Yq3Vk9Pqrm38vIJJLufPNB1uHkuu5wATlkcBD0=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/L3MON4D3/LuaSnip";
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "75bf643";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "75bf6434f175206cd219f9d2bbcae154a009346c";
      sha256 = "j26ufCjpIAaoaK2Dp9fI0oaEW05tC0a89omz6k3lpis=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/saadparwaiz1/cmp_luasnip";
  };
  cmp-nvim-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lua";
    version = "d276254";
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
    version = "d83839a";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "d83839ae510d18530c6d36b662a9e806d4dceb73";
      sha256 = "6WCIwAmCjOaBh1jrmeVttGQVNLZTPeWY2T7+X8wD9W4=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-path";
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "a706dc6";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "a706dc69c49110038fe570e5c9c33d6d4f67015b";
      sha256 = "FdWs15eTad4igwN5F5+CKxSMQi9eX07BXjM/HgTIURc=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/hrsh7th/cmp-buffer";
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "a6b4c95";
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
    version = "29ca81a";
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
    version = "29d12e5";
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
    version = "18fe311";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "18fe311bb967d16ddf2cc28e7e71f234c37d3e26";
      sha256 = "Pln8qhfjEJ2VXcDPZ0P6UNQHTcY3Xw58B4X56IVr008=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/windwp/nvim-autopairs";
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "80d427a";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "80d427af7b898768c8d8538663d52dee133da86f";
      sha256 = "8SINCRoarkkQdrKzq4xujn197G4BRHQ7HYJQj929nME=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/windwp/nvim-ts-autotag";
  };
  Comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "Comment.nvim";
    version = "00aff9f";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "00aff9f0fb75328c686a8484cd090ad72c355cb1";
      sha256 = "l84IFDOiqfPBdWxKbp51JJZZG6iTv/uBHtV5vFHU+gc=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "eb8ff2f";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "eb8ff2f55915a0b02167315e72fe7f60cbd7f16d";
      sha256 = "R5ie5E+AMCOTwYedXeIN0ltOxE9iKpAhwHd9X91TPRw=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  surround-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "surround.nvim";
    version = "a21c3ee";
    src = pkgs.fetchFromGitHub {
      owner = "blackCauldron7";
      repo = "surround.nvim";
      rev = "a21c3eeee2f139d20694ff70135b3557cadece1c";
      sha256 = "U0Kz99O7Vi9OAIxSFnqOfVtlVRvHlX2ExhPZnG0KSnE=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/blackCauldron7/surround.nvim";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "ef044ee";
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
    version = "bdd7153";
    src = pkgs.fetchFromGitHub {
      owner = "mbbill";
      repo = "undotree";
      rev = "bdd715338a3a0c82674153108a3deaf827d36cfb";
      sha256 = "J4qQS000SJ/CTElLhpEV0dVXGQ5XRg6SnENtpQCExrw=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/mbbill/undotree";
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "d68631d";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "d68631d2c02bd31d937349d739c625cc81dd9ac1";
      sha256 = "5DYBCXS+DLsoK5yNlcGVcKUYd/gbAOYuLIQbUVd2YGw=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  nvim-bufferline-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-bufferline.lua";
    version = "463637a";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "nvim-bufferline.lua";
      rev = "463637a3ac86dcaacbcd47aa608f53aaad749696";
      sha256 = "CBWRJiPYhNR86imNHt79P24uthMW09kRBQ53pCew8Fo=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/akinsho/nvim-bufferline.lua";
  };
  nvim-tree-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-tree.lua";
    version = "2e33b16";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-tree.lua";
      rev = "2e33b1654384921ec1cc9656a2018744f3f1ce81";
      sha256 = "VFiZJt6vCzSyK1BL9UYYKj3nBKMrthiC0GR3mEhma5E=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/kyazdani42/nvim-tree.lua";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "0f8df7e";
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
    version = "7b013a2";
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
    version = "36c610a";
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
    version = "5eb87a0";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "5eb87a0b05914d3763277ebe257bd5bafcdde8cd";
      sha256 = "jT01Opd/PEqXs80ZLCRqVcs0H28df+rNNp3n5wZ7lQk=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lewis6991/gitsigns.nvim";
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "3b378cf";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "3b378cfb74dcdd159f52d6506401915f65c51fd5";
      sha256 = "oFx5/IU3T8iHQY6lFnMBynyU8btQgn9cXyOR53C5E0o=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/lewis6991/spellsitter.nvim";
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "ef027e3";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "ef027e34b618eac42fb0111c1db670ba01793039";
      sha256 = "PBySkhxwqrVrUECsaqW6JXtDwfQXSwLn3xHcrESH0R0=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/rcarriga/nvim-notify";
  };
  nvim-visual-eof-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-visual-eof.lua";
    version = "3c001c6";
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
    version = "2beae05";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "2beae0581caa66cf8c09fad7c7c557f92d49d2bd";
      sha256 = "GwuMmUZTGk0hlB1dqXGosNRua+Y8woR6SvqqoRI6LOM=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/RRethy/vim-illuminate";
  };
  FTerm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "FTerm.nvim";
    version = "0911ab9";
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
    version = "6570fd2";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "6570fd271d17fec1966522f3a19cc6f4c88824c4";
      sha256 = "1sRrDNQ8OuWcN/yKTIQ1It3UkUDfe2Ln9d2CCuR0xS4=";
      fetchSubmodules = false;
    };
    meta.homepage = "https://github.com/folke/todo-comments.nvim";
  };
  editorconfig-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "editorconfig-vim";
    version = "3078cd1";
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
