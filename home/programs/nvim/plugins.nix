# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs) fetchFromSourcehut;
  inherit (pkgs.vimUtils) buildVimPluginFrom2Nix;
in
{
  popup-nvim = buildVimPluginFrom2Nix {
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
  plenary-nvim = buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "2023-05-31";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "499e0743cf5e8075cd32af68baa3946a1c76adf1";
      sha256 = "0r9aw3a53vzq0rdyvq7pi99pqbmnww0dm146pbj2kd33rb34daz6";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-05-27";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "2a125024a137677930efcfdf720f205504c97268";
      sha256 = "0hjfi7zrxn7hci0gagnx50p20afdg5c63skjbh89rvsh0v2qgg3f";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-05-15";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "3e96035d62290183fe7a11418db2b254fcfcaee3";
      sha256 = "12zdrwjlrvzlpwqi757llfvr7ir6ww949i85da385n2crj3jfd8i";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2023-05-31";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "16884855e65931cdec3937d60bfb942530535e9c";
      sha256 = "1zcxgh49a87ah77rav26m8zlgvx0k2q32m70i74x7pd3y0b3jjs7";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2023-05-01";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "708864fb2263226aabceaf5b2c2eee9841132668";
      sha256 = "149fngjrvkayj9y1qgyy5f9hr0ysz9chhqm5z573i5q9rgszh27i";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2023-05-16";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "46a78e02b5b009d22df7566cbc25f4ef565c5731";
      sha256 = "1k4rmrkl2ggsrp1c2r846g98kz8my8snzi5yk825is839acs517l";
      fetchSubmodules = false;
    };
  };
  leap-nvim = buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-06-02";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "14b5a65190fe69388a8f59c695ed3394a10d6af8";
      sha256 = "1p3bz2zs4s2kg1q1gyaf2pffp1fwd0hmh5cds8s8a1r3cab9mnap";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-06-02";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "52f6d1c48589479d519c1aaea93dba1dd550a7a4";
      sha256 = "16z6rzay9sn011pl1ljjqs2f2k7igzzyqg9k6dyzzxjb3k1037rl";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2023-06-05";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "2d6e73ab2fd1daad1e8134f174d06a869cbc96b4";
      sha256 = "03yq8586yp4fcv56cna8n3j0420771yv33jak7vrygsvr9621a1m";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow2 = buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-06-04";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "e1783c843fd0a604d071cb9f0c6919ac93bcd96e";
      sha256 = "0jh0rjg8swya2647nm5csmmv0b706s2piiiw5ngw8avm77z2f2dc";
      fetchSubmodules = false;
    };
  };
  playground = buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2023-04-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "2b81a018a49f8e476341dfcb228b7b808baba68b";
      sha256 = "1b7h4sih8dc55w12f0v5knk9cxfpy0iffhbvmg0g84if55ar616v";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2023-05-25";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "6d3fbffe426794296a77bb0b37b6ae0f4f14f807";
      sha256 = "171f5lprqfdyh2lg2wkakzdxkxpzxdd9x2nhmvhv63rbskf0v00l";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2023-05-25";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "9bc8237565ded606e6c366a71c64c0af25cd7a50";
      sha256 = "0g5n3x66kf5fbzv8rprpyi8hb6v961s0whk8dc6v8r1msc2m4zbs";
      fetchSubmodules = false;
    };
    buildPhase = ''
      make
    '';
  };
  project-nvim = buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2023-04-04";
    src = fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb";
      sha256 = "1md639mcs3dgvhvx93wi0rxiwjnb195r9al9bfqvcvl3r307gxba";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "09b0b17d824d2d56f02ff15967e8a2499a89c731";
      sha256 = "0iz0xingbfxlqxwm11hy77cf2awgr1610i2snrafmr346hdn0ywl";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-ui-select.nvim";
    version = "2022-04-30";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "62ea5e58c7bbe191297b983a9e7e89420f581369";
      sha256 = "09mbi1x2r2xsbgfmmpb7113jppjmfwym4sr7nfvpc9glgqlkd4zw";
      fetchSubmodules = false;
    };
  };
  telescope-toggleterm-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-toggleterm.nvim";
    version = "2022-02-10";
    src = fetchFromSourcehut {
      owner = "~havi";
      repo = "telescope-toggleterm.nvim";
      rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
      sha256 = "04vn8807gmhahhap55xjbabarlmqf05ygwqycsfkdcbm5jpcxdnw";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-undo.nvim";
    version = "2023-06-03";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "3dec002ea3e7952071d26fbb5d01e2038a58a554";
      sha256 = "1331qgsfxy1qsvxlkss2g713qlj2ri02ywbhiwwy5cyl8bc0rl76";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-06-05";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "664de12a7816dfa348bb475607edfa4fe0122025";
      sha256 = "0f2068l6kcrxxvk9wk8gxswqj0f3f6w6dm1nzmbcvqv4j5mvwnps";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-06-02";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "8597d57fb40d4ad503cf3acb2fdcfe1b0d8a193d";
      sha256 = "1s7xnl8rsav4237mzh37q4qflhbfb2sq7vasdfgzx4mgad2x6kx5";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPluginFrom2Nix {
    pname = "lspkind.nvim";
    version = "2023-05-05";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "57610d5ab560c073c465d6faf0c19f200cb67e6e";
      sha256 = "18lpp3ng52ylp8s79qc84b4dhmy7ymgis7rjp88zghv1kndrksjb";
      fetchSubmodules = false;
    };
  };
  nvim-navic = buildVimPluginFrom2Nix {
    pname = "nvim-navic";
    version = "2023-05-09";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "15704c607569d6c5cfeab486d3ef9459645a70ce";
      sha256 = "0wsrpz61ndgi2imzyn18s69zixvbmky5j1h5srfgv2cxjzdm67gh";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2023-03-19";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "a2907275a6899c570d16e95b9db5fd921c167502";
      sha256 = "1i2s3d9c0c31pv0y0iljqk2s3qcqanjw84w81ww2dnnh31qgglpi";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2023-05-29";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "58a4fee3d61a6fb3166163c55fe0b2eb29464f9c";
      sha256 = "1rh5hhgr3lzq144a7bm2wn25fcdd29y1sanw2y5i82ks159ivdk5";
      fetchSubmodules = false;
    };
  };
  comment-nvim = buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-06-01";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "c8043290f2d77f61025494d839d88e414608c460";
      sha256 = "126bbdlbsl0byxihwzj5j1lbkk1dcqrki4qh5wqa8i71d0dy7vva";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-05-31";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "51ebb4b6637290e1b8e0fb0d6f38b605d3c24940";
      sha256 = "1ncdr76izf38s9ia11f32byskz2spmb0x22ixvras2g19w2bk63q";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-06-04";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "9025d37189f26b6ca0b965a9e5eec3e69c37d2e9";
      sha256 = "0y3lbpqm2yby1i3mvybkkxn8sfiwbwxs685zpvpjq6l3b184h9jc";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-05-30";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "fc0f694af1a742ada77e5b1c91ff405c746f4a26";
      sha256 = "1vmsa4vrx7nsrq2kzh8pyjfssfhb9b7xy7qqcyja4g0xp9z9z077";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2023-02-06";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "0e6b2ed705ddcff9738ec4ea838141654f12eeef";
      sha256 = "0gpwwc3rhfckaava83hpl7pw4rspicblxs7hy3y57gb560ymq6hg";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2023-02-03";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1";
      sha256 = "0bkviamzpkw6yv4cyqa9pqm1g2gsvzk87v8xc4574yf86jz5hg68";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-10-28";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "18095520391186d634a0045dacaa346291096566";
      sha256 = "0b91ap1l3nph46r7b5hcn7413yj3zhrz1jmn4xqp387ng35qz537";
      fetchSubmodules = false;
    };
  };
  cmp-path = buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "2022-10-03";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
      sha256 = "18ixx14ibc7qrv32nj0ylxrx8w4ggg49l5vhcqd35hkp4n56j6mn";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = buildVimPluginFrom2Nix {
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
  cmp-treesitter = buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "2023-04-06";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "389eadd48c27aa6dc0e6b992644704f026802a2e";
      sha256 = "0kbxjpw7j90pgvwmx3cb47jkk01wx5q6fqr660llinqc1vmj1rsq";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2023-04-24";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "5af1bb7d722ef8a96658f01d6eb219c4cf746b32";
      sha256 = "02xpxdbjvic4l2s4fmhiy38igvvg0mdpi6hr49kvnibx1dyzhx5k";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2023-04-01";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f0f53f704c08ea501f9d222b23491b0d354644b0";
      sha256 = "1zcplbb2kkq3f9mmy6zfgscdiccqiwkjr4d91qqjxp80yi1v9z4j";
      fetchSubmodules = false;
    };
  };
  neoformat = buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2023-05-12";
    src = fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "2d5d071d5957681ae677ee06f6eb879a61b7b618";
      sha256 = "17rs8k6xzy4c8nkiap84h5n7m0wcam06r6mv2z207di0cck2f4pk";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-05-25";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "59df87a84c80a357ca8d8fe86e451b93ac476ccc";
      sha256 = "1c10abpmhcnv1adpm3niwy1q7knwxai19n7l27j5cf64jfk8594r";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2023-04-28";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "40615e96075c743ef47aaf9de966dc348bec6459";
      sha256 = "0x58mcz3ii3yv7rjfzgxsjy7vnvh0gpxyjr626766vf3ignfdzff";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2023-06-02";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "3625e099b09bff2db5f04082cb09ba679525980c";
      sha256 = "0nb7xnypv046lh73wfqhch54jx5h3xaxjin0qv9b3g0k5zd0mdi6";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-06-02";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "23e883b99228f8d438254e5ef8c897e5e60e75d1";
      sha256 = "1xjwah0g96mjv01lhd7yfml2gd15syhj2axbvid9xk4yn4m6hks8";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-05-30";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "10b20ca7d9da1ac8df8339e140ffef94f9ab3b18";
      sha256 = "1jag0bdk8jmh6dnrl5051jm3q5lq25lp4yvs9zsq574479czjw5g";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-05-17";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "2a151df2dc870e79b138a59ebaaaddf3d1b0d703";
      sha256 = "1sx2nl6w78m03n0aipv8v9r5w32zivx24ljfa6m00ni39acm0d1a";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2023-05-30";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "7075d7861f7a6bbf0de0298c83f8a13195e6ec01";
      sha256 = "0hcjr1a4vasjvgs8w7hpg0rdfr2aji6n376g062xjynh0302826q";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2023-01-20";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce";
      sha256 = "02r90cqx31ja7cglfliqw0wbsm8fxh5q784wapk82zlv1p7c8ip8";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2023-05-30";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "cf146a267a6a7db62b1e2aff40414b20081048a1";
      sha256 = "12windxwl9icn1g9yh36nw4brsmlb2cx16ay68p0dk16axvnhf22";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2023-05-23";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "b183133fd25caa6dd98b415e0f62e51e061cd522";
      sha256 = "0ychlw7lnnpmjflb5f5xyspv63kyrdzbxx88aw9ifaqiiyz3i4aq";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-05-25";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "f868d82a36f7f7f5e110eb0a9659993984f59875";
      sha256 = "1pbrm7y6z1b96yy8v9chn69jfbznlzrkygp802cb4946snnb5dj7";
      fetchSubmodules = false;
    };
  };
  nui-nvim = buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-06-04";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "d5a82aae64426a805e19d8ef5a379292f9dc55d3";
      sha256 = "14mnskwvzsva5pxh909xgrzg1cy7r4459f0g85dkqr8z4c9yajic";
      fetchSubmodules = false;
    };
  };
  nvim-notify = buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-05-13";
    src = fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "f3024b912073774111202f5fa6518b0cd2a74432";
      sha256 = "05hwq6yvjblngvh9r5rkdxx320a9iqb79gjqzdzxsnlb2pzp5jsq";
      fetchSubmodules = false;
    };
  };
  noice-nvim = buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-06-04";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "7b14678f83ad1a875b1bcea34de4377ebfb50973";
      sha256 = "05y8lz4r4rmjbnma7zv3fz0lknlgby6385sai92zkh5a959bj51x";
      fetchSubmodules = false;
    };
  };
}
