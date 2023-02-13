# This file has been auto-generated
{ pkgs, ... }:
rec {
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-12-28";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "c90e273f7b8c50a02f956c24ce4804a47f18162e";
      sha256 = "1cd1l55lax3938ym0kpwz0gpzmfi8rxq8rgl3l8vhq9frlaqyn53";
      fetchSubmodules = false;
    };
  };
  popup-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "popup.nvim";
    version = "2021-11-18";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
      sha256 = "093r3cy02gfp7sphrag59n3fjhns7xdsam1ngiwhwlig3bzv7mbl";
      fetchSubmodules = false;
    };
  };
  plenary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "2023-01-30";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9";
      sha256 = "1xy4hs0pckzbxd249zwg2r0vi94fy9arb966nypw1dx4vxw8072z";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-02-12";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "bd7a222287c5828cd0607cd0a5605e52f0460074";
      sha256 = "0yfik58mixrlhjla7aw4di61yzxkk79s9fvz6ly2vg5vdacf40bl";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-01-10";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "27da4724a887dabed3768b41fa51c785cb62ef26";
      sha256 = "1wylh055y2dyb7zcdk9sa41wnkfbknp2bgnlrhmxdq5h2bkr8hbd";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2023-02-04";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "14b9c4cc572c3be5cf5b0a678e7ac240f08a8681";
      sha256 = "1mnql64irf4dshfkii5dbfm3l7gigxxzs65knsva8gvfmh9pdzbn";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2023-01-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "31a2099627cd1ef8898f442ee6a58c7400111395";
      sha256 = "0dykwmx1f6ack7nl4br7vs8algmj5yz5a8v3djbk62fx6alzjrq6";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2023-01-23";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "42d09f1e6324d98aa2e5b765b64528e0aefe72b0";
      sha256 = "0mdmp7cnfas9bxgfsxxpj4k38vv9yrhr3l0chh8zrd98jndy4fm4";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-02-13";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "1367a095f336c6c7ccda8c6747b57048fc5e008d";
      sha256 = "1h6q53h6cqbbsqyjs70hkqi7bcra8hbrym6iib6bsh1101w4a8h7";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-02-05";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "798274ba3c454a9aa3cd71f95a86ea55cbbbb142";
      sha256 = "156g08ab9jghi580b1k88si3bc6h72d77avlpn34dnnn5481anvh";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimPlugins.nvim-treesitter.overrideAttrs (_: {
    version = "2023-02-13";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "ad9ae9e7def54fee446c3e186ed0a0d44cca7b90";
      sha256 = "14vdlr7wl1389mfmlsy383d5v283h9ak0w1dhba39ll3i2nj731d";
      fetchSubmodules = false;
    };
  });
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2023-01-09";
    src = pkgs.fetchFromGitHub {
      owner = "mrjones2014";
      repo = "nvim-ts-rainbow";
      rev = "aa83e4967bf78f85ffd9a11e159900c7ea7e423b";
      sha256 = "09x3bq4j9398avmzix78gm1qam0m34r9ifz7rb6l5rcqw7lhvr5q";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2023-02-02";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "c481c660fa903a0e295902b1765ecfbd6e76a556";
      sha256 = "0d30s2rnjdizy8mibxl7pw99ij8209k09myv03d2sqnzapgx28ib";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2023-01-31";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "203bf5609137600d73e8ed82703d6b0e320a5f36";
      sha256 = "1h64qyvvnzv7ph49vciv2izv9ws7ds1z9cncrmxs7jwlh3vv10ig";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2023-02-05";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "580b6c48651cabb63455e97d7e131ed557b8c7e2";
      sha256 = "1yjdn4729syz80radl90f2bsh7jl73rxq5ss0yp2qjj7aj8hkhm6";
      fetchSubmodules = false;
    };
    buildPhase = ''
      make
    '';
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2022-10-29";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "685bc8e3890d2feb07ccf919522c97f7d33b94e4";
      sha256 = "0s734kpy3hslb7n6y94cv08clvxh5qp6br1ns3178y99ysv36vkx";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2023-01-23";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "74c7d28cb50b0713c881ef69bcb6cdd77d8907d1";
      sha256 = "1k42l9ghpkds2fqxj8f0anlh4gkpiid28zwkhy29k2br21m7q5fq";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-ui-select.nvim";
    version = "2022-04-30";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "62ea5e58c7bbe191297b983a9e7e89420f581369";
      sha256 = "09mbi1x2r2xsbgfmmpb7113jppjmfwym4sr7nfvpc9glgqlkd4zw";
      fetchSubmodules = false;
    };
  };
  telescope-toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-toggleterm.nvim";
    version = "2022-02-10";
    src = pkgs.fetchFromSourcehut {
      owner = "~havi";
      repo = "telescope-toggleterm.nvim";
      rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
      sha256 = "04vn8807gmhahhap55xjbabarlmqf05ygwqycsfkdcbm5jpcxdnw";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-undo.nvim";
    version = "2023-01-29";
    src = pkgs.fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "b5e31b358095074b60d87690bd1dc0a020a2afab";
      sha256 = "1hpqd0dgb01in5dbqs2ps3wr12iqnf0pd0xdnaalvq7rmvsmvz7a";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-02-12";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "1712672e4da3003a0dd9f771d30389600b360f42";
      sha256 = "18dpijknw3w82rag39acw60vwc6q0apc8hm82x6103gqsimcs3as";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-02-09";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "8fe3be1c08ab0bb55f2998fbc02f1a08f87a44bc";
      sha256 = "08nkbwzby8j156n3s89aj3nbhy99pb0nkpdj3rqqvrbyqyia5jbn";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind.nvim";
    version = "2022-09-22";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "c68b3a003483cf382428a43035079f78474cd11e";
      sha256 = "0qrfqajpbkb757vbcjz1g7v5rihsyhg1f1jxrbwg08dbxpw101av";
      fetchSubmodules = false;
    };
  };
  nvim-navic = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-navic";
    version = "2023-02-04";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "7e9d2b2b601149fecdccd11b516acb721e571fe6";
      sha256 = "02dzs5bh29ncvz3nzc2isnz9y5c99mx5qm97nvwrbbvxcp3yah2m";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2023-02-10";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "49062ab1dd8fec91833a69f0a1344223dd59d643";
      sha256 = "15456qlblskafaq3x92kp8n8hdfzdfv1hzs9yb4k4aqps1bj2plf";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2023-01-29";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "379be679d3c5f80964bc19131554b846dce5d34e";
      sha256 = "019wc4kxdyzpdbjazsy9ji1r0ymgbwx620ghvqw4wdvccyklg5if";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-02-13";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "418d3117dab2f54c4340ea73e0070dd78fc81753";
      sha256 = "0qmkj4xchl3q26pzf6x8ssm97ax72vav4jcq4410mf7xiahwcl1d";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-02-11";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "58fbfc627a93281a77f7d161d4ff702e639677b1";
      sha256 = "0kkk9c3py2hcn2gkwsni4kcw0n6mqbqlqpvyiprmmf3ixdpi8cnr";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-02-12";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "1645e7cd98ed99e766c84ab3cf13a1612c77dcee";
      sha256 = "13zvkv7vnfrj0xs31s1gv74amxpdyvc2m2x8br58vxfscy3wbaa4";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-02-11";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "aae0c3e4e778ca4be6fabc52e388cbd5b844b7a5";
      sha256 = "015liiv48dg1yangmfjvbnqiv8gkzl9b8y5c3f0x2ppax2a3hp8y";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2023-02-06";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "0e6b2ed705ddcff9738ec4ea838141654f12eeef";
      sha256 = "0gpwwc3rhfckaava83hpl7pw4rspicblxs7hy3y57gb560ymq6hg";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2023-02-03";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1";
      sha256 = "0bkviamzpkw6yv4cyqa9pqm1g2gsvzk87v8xc4574yf86jz5hg68";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-10-28";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "18095520391186d634a0045dacaa346291096566";
      sha256 = "0b91ap1l3nph46r7b5hcn7413yj3zhrz1jmn4xqp387ng35qz537";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lua";
    version = "2023-01-05";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lua";
      rev = "f3491638d123cfd2c8048aefaf66d246ff250ca6";
      sha256 = "0qydmgfgarf17hz10i6ffqvppmyrj3q1dm2awksk4l4y6z0cgg7w";
      fetchSubmodules = false;
    };
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "2022-10-03";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
      sha256 = "18ixx14ibc7qrv32nj0ylxrx8w4ggg49l5vhcqd35hkp4n56j6mn";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "2022-08-10";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "3022dbc9166796b644a841a02de8dd1cc1d311fa";
      sha256 = "1cwx8ky74633y0bmqmvq1lqzmphadnhzmhzkddl3hpb7rgn18vkl";
      fetchSubmodules = false;
    };
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "2022-10-29";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "b40178b780d547bcf131c684bc5fd41af17d05f2";
      sha256 = "076x4rfcvy81m28dpjaqcxrl3q9mhfz7qbwgkqsyndrasibsmlzr";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2022-11-27";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063";
      sha256 = "0vffivj94736njjhlazrs0jkc1nyvcdjpw64w38d1lhlyflf4cl7";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2022-10-24";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "069a207be6a0327dcc62c957dbb38156b210733a";
      sha256 = "1gpw9zmx60y6zrxb7ncgmak7sgzg8j5fhd4hqx2qkkrq6qkh07d3";
      fetchSubmodules = false;
    };
  };
  neoformat = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2023-02-04";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "2e9fd3a7cbdce0c90379c8bc52e0bca6726eba81";
      sha256 = "02f77wwhb1wfk9bcvy5mnc4r2rdgw6b3pdmacizmjnd1a9ajqysn";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-02-07";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "45ae3122a4c7744db41298b41f9f5a3f092123e6";
      sha256 = "16zryzm0ng0f8zl13jpkhjmqya0rbs4vy2zdm9zhd2qsnnpbb6rh";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2022-08-11";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "fdefe46c6807441460f11f11a167a2baf8e4534b";
      sha256 = "0cwz18risvkgwr3ppc2vqs6rk94kgra4vmhswn4699fnsmha5lcn";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2023-02-12";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "945e01e39fc137bd74bb3aa8c4f40e6ffb5be2dd";
      sha256 = "04lzlz7y72nw5in3r46xc8xb1f4avdcjbwl1sic9v0gbr4w3g2hb";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-02-12";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "37e3c7b32b653f24d7aa2fa087a9c5a67ef07786";
      sha256 = "1xjqzqblw89z6jk3g98bc10yc9xmdr8h1pblv1vg4jsdsdn0iwjd";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-02-09";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "90821ad682aac189cd0a38fd83fc96f0cbcc5d29";
      sha256 = "0lirvmb9yc2yc8an2x0wll1vwlpc4fh95x3r5wh21s8m0nqvv577";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-01-30";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "81ceb3025e6c7030c42accc3951dad94f31ff0c8";
      sha256 = "0m8z7k0pw7vmwmw21lcil0iprdb9l9yfx4yjk05h65027j8xhk7c";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2023-01-26";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "8299fe7703dfff4b1752aeed271c3b95281a952d";
      sha256 = "1z2rnaa9p62yid89n9pni9jzzdlcdc55i95c67yn5qzxd3h637hi";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2023-01-20";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce";
      sha256 = "02r90cqx31ja7cglfliqw0wbsm8fxh5q784wapk82zlv1p7c8ip8";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2023-02-02";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "19aad0f41f47affbba1274f05e3c067e6d718e1e";
      sha256 = "1zslvsdv6y15yiqjyq52mdib15rk7k7k2qg1shwxhjjipgzykvpl";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2022-12-31";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "6a2f1ae05ba036ca1e9c505f4d58b9a188ef51bd";
      sha256 = "12rs0c7sx0j8k646ycvypc9vi9k9fx17pihd3fhvccwyjwk7iafi";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-02-13";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "a5caac26768af80b7c57b919f77b3fed3d7424d0";
      sha256 = "1wd6pxkq7pm0mzgns2r04v8m9snxr4va6rfgr8zf4g1ifyfyh8gk";
      fetchSubmodules = false;
    };
  };
  nui-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-02-01";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "d147222a1300901656f3ebd5b95f91732785a329";
      sha256 = "0p2sc3jnkvxax55acizjjna2rh9bnwfrm7z5apyasyzvlixgxxz2";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-01-18";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "bdd647f61a05c9b8a57c83b78341a0690e9c29d7";
      sha256 = "0fnn4jarxmp43jyk4j13wpk9zd7r7pjjmgqbr8brzfd3f9xabx6c";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-02-07";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "d8a1f3056ad713b5d471048f8d029264828e22c0";
      sha256 = "0m6058yy4bn66bdr47na91g4pnm27y3msr386hj0hss975iaicwq";
      fetchSubmodules = false;
    };
  };
}
