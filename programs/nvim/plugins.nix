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
    version = "1650205145";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9069d14a120cadb4f6825f76821533f2babcab92";
      sha256 = "QKVFz95XaJrwkFaWqUHBirMFagellRn2YpNYnBeI/10=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lua/plenary.nvim";
  };
  legendary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "legendary.nvim";
    version = "1650395874";
    src = pkgs.fetchFromGitHub {
      owner = "mrjones2014";
      repo = "legendary.nvim";
      rev = "77b7bc365c2470aff48b7398eb940e8c88789af3";
      sha256 = "YQVmnrOXmy/3DKA5VrmewRGob19zZUocTuVJUDTmrnM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/mrjones2014/legendary.nvim";
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "1649274039";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "1c96ef6d44f6d2a8a034f4eb242ddaa015674d1c";
      sha256 = "D4UuAdiQVW/kgIMdNkfso8UvSJGkN1tIkAbEilxreXM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/gbprod/yanky.nvim";
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "1647531286";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "b46773268e66ecd371d0b32f17f7a85242475649";
      sha256 = "M9Q4wWHv4exOWvp05bierAkzUNlArNGmKendciiiJnA=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/gbprod/cutlass.nvim";
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "1649272848";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "66379e99812ce5f46aa4810c05460c87b7b40aac";
      sha256 = "B0CSMKwRMISfeLJHZuPsiu51BENyZC8I/HhisH+W3Nk=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/gbprod/substitute.nvim";
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "1650369149";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "4e4ce2bba4fa6c30fc9e8999e71dcc67386732b0";
      sha256 = "TG5tAzr+erpTHiaL/VaJC4rMOcqY7abzhpN5lNsFnCs=";
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
    version = "1650378521";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "62fa8f77c43ed3a4ac2bbdfa4327f6b4a835bbea";
      sha256 = "GZgU5rdNYUQSsrQablM8n7ZjOCbK3h0J6lwUlfT6ADM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter";
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "1650194589";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "04284dc97eac0d0ecfea68e10be824d1a6585de0";
      sha256 = "Q7aRv/UivnkAVLDcuSI6HD9q9LeASqQ3F2KEHCoqEcU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/p00f/nvim-ts-rainbow";
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "1649436240";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "13e2d2d63ce7bc5d875e8bdf89cb070bc8cc7a00";
      sha256 = "2gKGDUvEVCVOX1hbnc4WDlcjsE8YnhrTMqv6POx4k84=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/playground";
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "1650283557";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "6e7ed1b9638f09661fcb3a6db68f3ad77c8036be";
      sha256 = "vjrBJYfoUNpw+fCOMAzt+zcMNFE8W+fUY2lhwqJf5YY=";
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
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "1650231919";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "ad9903c66bac88f344890acb6532f63f1cd4dac3";
      sha256 = "uoq6HLqH2/zBKGZFYQ7HbzZ+QOLTpJpBaGD6UZ4oz4E=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/neovim/nvim-lspconfig";
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
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "1650293110";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "e5416bdb27a0e61cd213850646534a18bb2ba61d";
      sha256 = "v4bItOqhrutK7Wr/pM1Pkx+lGFTGrLoZ88esm1K/MuM=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/mfussenegger/nvim-lint";
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "1650006023";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "6b67cb12747225a6412d8263bb97d6d2b8d9366a";
      sha256 = "w73j+QzR+qriRplGP56TePaGUCAkQgBbMZjV8dGcQSE=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/L3MON4D3/LuaSnip";
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "1650365016";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "07132dc597e94a8b6df75efce9784a581f55742c";
      sha256 = "9wPv8mXax2fr1L6TeiFOSK7ZdXNg1v/1eRj00OFDw1Y=";
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
    version = "1649893462";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "38d486a1c47ae2722a78cf569008de0a64f4b153";
      sha256 = "u/8JiOyc8SIUALHoHtXwEgyK6usTWIDl2pjNiNgZamI=";
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
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "1650062917";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "29c5e9effe53f19f250e3a88d1427b35031bc90d";
      sha256 = "bIsie9TkSk7LMMQq98StmViXPaZBWS60i5xd7EB7dyU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects";
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "1650385199";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "bb04f9fa64b96bd3d6c4c146c6f9c55a69587fac";
      sha256 = "GB5QEYAEHfxHcQW7G9wGeSkhbStOGn4w6FfgsZvuL/M=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/andymass/vim-matchup";
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "1650237629";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "18a07f790ed7ed1f11d1b130c02782e9dfd8dd7d";
      sha256 = "E5ll0ctLQjILvciHLOOV5m1yQZp/uBJ5H8lYeZ6QbiU=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/nvim-lualine/lualine.nvim";
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "1650273959";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "49172206754f7ee0f3ac1b461bbac1a357cd0879";
      sha256 = "lRpY392iG01v/0od7ZVZAldgwGmf2CT2eIeltiuZtg4=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/akinsho/bufferline.nvim";
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "1649991995";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "045d9582094b27f5ae04d8b635c6da8e97e53f1d";
      sha256 = "pMVby6w7UTR2f1Nxp0ZPlV+KrdXNJ+jEQeQe30Pfs3M=";
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
    version = "1649870230";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "c8dd268091ffcbcb673de59c5b37ff26a2eb24ed";
      sha256 = "wYFp30yBTJ52lEDtK2u33TwLdEgeaeXXCKFXd+kuvig=";
      fetchSubmodules = true;
    };
    meta.homepage = "https://github.com/TimUntersberger/neogit";
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "1650381932";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "498abfa13dd749be963bc87a5b37da0d3e42a50e";
      sha256 = "+2mRED2gumFlgKJRYNt+Ex/ZgmMg25ANKaY++7C9ooU=";
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
    version = "1650187882";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "2c8f744de34c72a5a1fabcc66da11aa017ffab88";
      sha256 = "FoFpLMDJANGCJeBSXcGHIaqJ6MaSKdTOknM7MLZDifk=";
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
}
