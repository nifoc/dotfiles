# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
{
  popup-nvim = buildVimPlugin {
    pname = "popup.nvim";
    version = "2021-11-18";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
      sha256 = "093r3cy02gfp7sphrag59n3fjhns7xdsam1ngiwhwlig3bzv7mbl";
      fetchSubmodules = false;
    };
  };
  plenary-nvim = buildVimPlugin {
    pname = "plenary.nvim";
    version = "2024-05-20";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683";
      sha256 = "0n2p8krzwiw682f0yb6n8faamffpp336rjy50pbqf3jmc6czd5z4";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-07-28";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "5be6c4e685618b99c3210a69375b38a1202369b4";
      sha256 = "0dz5ay92n60r7k3zir7jqznjs9jgl34d03xmn7cbzvhbad3n2m8q";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-06-01";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "f73bba23ab4becd146fa2d0a3a16a84b987eeaca";
      sha256 = "0dl6nmmkkdrwl982m1ji7cw2mkln2c4iiwrg06gs0v3sx9qkkqqm";
      fetchSubmodules = false;
    };
  };
  vim-cool = buildVimPlugin {
    pname = "vim-cool";
    version = "2023-09-06";
    src = fetchFromGitHub {
      owner = "romainl";
      repo = "vim-cool";
      rev = "662e7b11064cbeedad17c45d2fe926e78d3cd0b6";
      sha256 = "1ilddllx5riyzw4dx05rnvcxgngg7y2iydnkjn01wlddmid65p9k";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2024-06-10";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "73215b77d22ebb179cef98e7e1235825431d10e4";
      sha256 = "03qdr72nssiwm12fmvmi3x579d4rxkfhscphsr107l3widc5a7j0";
      fetchSubmodules = false;
    };
  };
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
  };
  substitute-nvim = buildVimPlugin {
    pname = "substitute.nvim";
    version = "2024-07-06";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "97f49d16f8eea7967d41db4f657dd63af53eeba1";
      sha256 = "017g2y3hmwa5ar778djr86x9v2nc9lg84njx82rajs6lx28a8m94";
      fetchSubmodules = false;
    };
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
  };
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2024-07-12";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "fdf503e52ec1c8aae07353604d891fe5a3ed5201";
      sha256 = "1f032gwhr92w57mb5bfsgr14ayi7qg93rvjq04cy5kwdniqg92ij";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-07-28";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "2d5133f67429f82547ea5fad33a0b1e7d4f78a1c";
      sha256 = "0ij32nkljw7a2k0kadx077nxwlfxymjdk984ngna9fzjg21m9wwq";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-07-28";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "a727bd368e70808125b7cf589328cc595faf3d5a";
      sha256 = "1mbsw1gxcdi57lsmvlyx3i8wfcqphgpvi7b5rdbspb9blliqrhg8";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-07-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "8f45f353dc3649cb9b44cecda96827ea88128584";
      sha256 = "0f6ranmfx33cvymigxyvrz4f8jb8k2k9mhlq7fqi5bl1ash0add7";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2024-07-26";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "10b8a82b042caf50b78e619d92caf0910211973d";
      sha256 = "0i6znzbcv5m87nakhqdqn5cfkghdhbfww5avd0x8m25a2lkgl77g";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = buildVimPlugin {
    pname = "telescope-ui-select.nvim";
    version = "2023-12-04";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2";
      sha256 = "1cgi4kmq99ssx97nnriff5674cjfvc3qsw62nx3iz0xqc6d4s631";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = buildVimPlugin {
    pname = "telescope-undo.nvim";
    version = "2024-06-30";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "51be9ae7c42fc27c0b05505e3a0162e0f05fbb6a";
      sha256 = "1xz2fccjp1rv7l0xzkczz4z2w32q8slc9lc6rm5219s1hl7k4nam";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-07-26";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "f95d371c1a274f60392edfd8ea5121b42dca736e";
      sha256 = "0h93s14vqrwg7gkqji1pc3p3h72niy1hdjd387mz5j62h7k6h74h";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-07-12";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "6bfd1591583b02e742fc3a2f43393c4ea3b6d3c7";
      sha256 = "10178jwv5mzq4lgxpspyfvjrylxix6gpm0pcy98h8gisxz8kv0yh";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-07-25";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "6eb8cee613518fb065d23a81d01eeb42365d59c1";
      sha256 = "1cnd2wp67r71wkxf90hwiw0x9i27ap57wxihngasvnqn2swslm31";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2024-07-25";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "cff4ae321a91ee3473a92ea1a8c637e3a9510aec";
      sha256 = "0l66zyawfjy0r7rhi80skk6x156ybr72jlh4qxk0xd0l2hkbm8nl";
      fetchSubmodules = false;
    };
  };
  nvim-navic = buildVimPlugin {
    pname = "nvim-navic";
    version = "2023-11-30";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "8649f694d3e76ee10c19255dece6411c29206a54";
      sha256 = "0964wgwh6i4nm637vx36bshkpd5i63ipwzqmrdbkz5h9bzyng7nj";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = buildVimPlugin {
    pname = "vim-illuminate";
    version = "2024-05-17";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa";
      sha256 = "0g86iv1mndcalrizdhl3z8ryj19jnqv139jwijpzyfk8gi677lhd";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-06-26";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "efc6fc83f0772283e064c53a8f9fb5645bde0bc0";
      sha256 = "1garyyavgg2xfdkw8s9jjq4p5mv5i6m54m8dszdhvkad5ni1zlvb";
      fetchSubmodules = false;
    };
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-07-24";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "98d7d4dec0af1312d38e288f800bbf6ff562b6ab";
      sha256 = "12g6rwrj67wk4fxxl31rsras5jw6a73xngrazlw095xhz6sd9l71";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-06-28";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "ce0a05ab4e2839e1c48d072c5236cce846a387bc";
      sha256 = "0s25ihd08p7d55hss2m76hq4als5s2cfzi0wn0c1qar2ydn9ydyf";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-07-16";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "d818fd0624205b34e14888358037fb6f5dc51234";
      sha256 = "18yjwihrr4ykq2h8yv67550358bmxi6maqvrhhbvxf402r01zkld";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPlugin {
    pname = "cmp-nvim-lsp";
    version = "2024-05-17";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "39e2eda76828d88b773cc27a3f61d2ad782c922d";
      sha256 = "13zcw6c7zppvbsjlr8yj3vml6ayalvhjbbqszljmn1f9hmkpwg89";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = buildVimPlugin {
    pname = "cmp_luasnip";
    version = "2023-10-09";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "05a9ab28b53f71d1aece421ef32fee2cb857a843";
      sha256 = "0gw3jz65dnxkc618j26zj37gs1yycf7wql9yqc9glazjdjbljhlx";
      fetchSubmodules = false;
    };
  };
  cmp-async-path = buildVimPlugin {
    pname = "cmp-async-path";
    version = "2024-02-02";
    src = fetchFromGitHub {
      owner = "FelipeLema";
      repo = "cmp-async-path";
      rev = "9d581eec5acf812316913565c135b0d1ee2c9a71";
      sha256 = "0dv00zsgyjqk98cnxkmc4hjqgsm5mhjg4q2j7xkwz17kq59fiv26";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = buildVimPlugin {
    pname = "cmp-buffer";
    version = "2022-08-10";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "3022dbc9166796b644a841a02de8dd1cc1d311fa";
      sha256 = "1cwx8ky74633y0bmqmvq1lqzmphadnhzmhzkddl3hpb7rgn18vkl";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = buildVimPlugin {
    pname = "cmp-cmdline";
    version = "2024-03-22";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "d250c63aa13ead745e3a40f61fdd3470efde3923";
      sha256 = "1sh4ar3ky4qikh2brlwy9nmhy3208fs77ysbgvhccj0lx2krf6c8";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = buildVimPlugin {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f94f7ba948e32cd302caba1c2ca3f7c697fb4fcf";
      sha256 = "0iyy37l0pc09hs610c40q5qzvg344200kvdkn0z8pjc4zk9wc6q4";
      fetchSubmodules = false;
    };
  };
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2024-07-23";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "25d48271e3d4404ba017cb92a37d3a681c1ad149";
      sha256 = "0dbw1b25g83iy6yvc725k7il0l7yli4qd9s4wylcbqgacss2nz3h";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-07-23";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "e38c5d837e755ce186ae51d2c48e1b387c4425c6";
      sha256 = "16wm535ihr8gxngx6a5xj4phz6qjshxi4nrcx2ks4bmd815gdsnv";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "1535a769d5dca851fe7d41b0be95f7c7203a4bef";
      sha256 = "0vw4fwyzkhg0fqavp90mq5smh95qcksjbld7cfpyrzqcj678h3fk";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-06-05";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "34867c69838078df7d6919b130c0541c0b400c47";
      sha256 = "0c8f2y8glhsbd2nbb0iwjly8f07mjy55z3j53l0p360dgj23kmpw";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-06-24";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "ec2dc7671067e0086cdf29c2f5df2dd909d5f71f";
      sha256 = "1d5ffrsl1ryiq8nzxx7k69gpin6zs2ys4zc5pg47qcpazx7my8qc";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-07-23";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "71c972fbd218723a3c15afcb70421f67340f5a6d";
      sha256 = "0cap7h95qkf34bq2abjl4l6ai28c1lwqc7g1qplga72hd1c1l48z";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-05-21";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "0d797435e54645a5f98bad7ad6046aac1ef95c1e";
      sha256 = "0payyx0j0s4wgk5xvczdnjqkj5nymlhw4f7hcw3sl9m334vnxshb";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-06-28";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "65e20ab94a26d0e14acac5049b8641336819dfc7";
      sha256 = "14v9mglm2zykylga0lzh9w1vcmxixya7xg2k4z4m6f4a3l21farx";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPlugin {
    pname = "virt-column.nvim";
    version = "2023-11-13";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "b62b4ef0774d19452d4ed18e473e824c7a756f2f";
      sha256 = "02lp989lykxw3qzv66ch47lz7n99xf3b3bghqhsnadrhnlky6n7f";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPlugin {
    pname = "urlview.nvim";
    version = "2024-06-04";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "c07733179e27c225ac3c58c3951701ee10b2dbde";
      sha256 = "1qbqn9h7602dw8vgj5m1i45g679n8j82h38hl0ab9lhxxykf2cys";
      fetchSubmodules = false;
    };
  };
  hover-nvim = buildVimPlugin {
    pname = "hover.nvim";
    version = "2024-06-12";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "hover.nvim";
      rev = "4339cbbcb572b1934c53dcb66ad4bf6a0abb7918";
      sha256 = "1nnhm8xhkdjvqal7016v22cljhpga8y0mydmvalz954cviskhna3";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2024-07-25";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "f074844b60f9e151970fbcdbeb8a2cd52b6ef25a";
      sha256 = "07q5mh82p9y6h047xifj0fpan6ny6cb56y4ghymrvq1ziahi0xcw";
      fetchSubmodules = false;
    };
  };
  diffview-nvim = buildVimPlugin {
    pname = "diffview.nvim";
    version = "2024-06-13";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "4516612fe98ff56ae0415a259ff6361a89419b0a";
      sha256 = "0brabpd02596hg98bml118bx6z2sly98kf1cr2p0xzybiinb4zs9";
      fetchSubmodules = false;
    };
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-07-23";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "2b74a777b963dfdeeabfabf84d5ba611666adab4";
      sha256 = "1kbzw9z83rh210r7kgx9r6q0phji539zvrdj963g4gf438nrplib";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-07-13";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "d855eed8a06531a7e8fd0684889b2943f373c469";
      sha256 = "0lb8zbncdlq91f4x8jqijpqvaigjw7f8b79milxwa11wvm25sg3y";
      fetchSubmodules = false;
    };
  };
  which-key-nvim = buildVimPlugin {
    pname = "which-key.nvim";
    version = "2024-07-24";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "6c1584eb76b55629702716995cca4ae2798a9cca";
      sha256 = "0qwwj4r5hvsmsjz352aqa4hv3f9pms6r67c4yh5imn5iyvinrzwy";
      fetchSubmodules = false;
    };
  };
}
