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
    version = "2023-09-12";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9ce85b0f7dcfe5358c0be937ad23e456907d410b";
      sha256 = "0772bqmfkx27b6kfn8x28v8ll0qr2zvdclynansraprrzllsqymk";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-09-11";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "925e2aa30dc9fe9332060199c19f132ec0f3d493";
      sha256 = "0i2ixmmapld2j681z606g00ws17vwzmpb0cxvbzsx9bqhap3qgzr";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPluginFrom2Nix {
    pname = "wezterm.nvim";
    version = "2023-09-13";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "4d626e4d868a8c53b8a787f50d2fd533673e864f";
      sha256 = "0i061n9sr3lb3gsymz9a7amv667vq1kqczvwmx8i4711k272raz7";
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
    version = "2023-09-11";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "4c85d8d6808d9859e72f8bd6c25302199e6a5eac";
      sha256 = "0ph1mc7nlfsx0aaybnvg6wwpx7hv2ks621qkjcrl3hf8dbc173xs";
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
    version = "2023-07-20";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "89dbe55cccee36bcb5e2be8c2d92ff8716601734";
      sha256 = "01cwgkgf8kgi4x4flwwfaj4qgafvnzaiixn68im4279rm6m1ic6y";
      fetchSubmodules = false;
    };
  };
  leap-nvim = buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-07-23";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "5efe985cf68fac3b6a6dfe7a75fbfaca8db2af9c";
      sha256 = "093fzf1bki2ll3lrqbnrw9w7i7aajbma4zq83c2nkxwi5gj5jqgl";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-07-29";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "9fe831e685a76e1a1898a694623b33247c4d036c";
      sha256 = "03mrsy17fvdislkf50hfxp87kw2k53zfyygc21ln11792k2nmfc1";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2023-09-13";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "9ab4e9cc8989e3811b14897cd0eb21ae35e5541e";
      sha256 = "1jd3wylb9ibd0pylpmpzhir9290qmmx5gradqxd5vvarr5wvpzak";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPluginFrom2Nix {
    pname = "vim-just";
    version = "2023-08-02";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "927b41825b9cd07a40fc15b4c68635c4b36fa923";
      sha256 = "11j6l136rskm19p19mjxvws5yp99s3d5h7mg3wq3mka18mcmhv06";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPluginFrom2Nix {
    pname = "rainbow-delimiters.nvim";
    version = "2023-08-26";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "9cbd3dc409af1f5531778ccd1ea6bce668241f39";
      sha256 = "0qz4my1xw1vww2109s8icscwfysa2aak3kjq2wym2smm259gd8g1";
      fetchSubmodules = false;
    };
  };
  playground = buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2023-08-26";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "429f3e76cbb1c59fe000b690f7a5bea617b890c0";
      sha256 = "1flqiycr7dm4cyp2gpy3dmkk8xcdk4268kgmp5qz43qf7fi8m7iy";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2023-09-10";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "a19770625aed49ad2a9f591a5e3946707f7359f6";
      sha256 = "13r2bbmylh9n5yqmc8mff669w6c4wx0j20xiy4sx2cdmfj089a9k";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2023-09-10";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "6c921ca12321edaa773e324ef64ea301a1d0da62";
      sha256 = "101dxn7jfyg2wdzkw5cnrw475mg0p3w475l1hplqfhghz33zb1hy";
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
    version = "2023-07-28";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "3094ead8edfa9040de2421deddec55d3762f64d1";
      sha256 = "0qmx94fq1pllwnwzav87fi3v9d64sm8ggv9jgs19flr6r8kh0vs2";
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
    version = "2023-09-12";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "360a895125ac4f39df6aa8f763635eff07e69fff";
      sha256 = "0sy9w8bl46i9krikxkbnsryrnnccji2hrw29k3ccihnn8nrxwvsl";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-08-01";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "095dc490f362adc85be66dc14bd9665ddd94413b";
      sha256 = "02b1kqfmj03snmvjd1z1piklihxq2n0w7rpdchaf6ylqh0arka7h";
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
    version = "2023-07-21";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "9c89730da6a05acfeb6a197e212dfadf5aa60ca0";
      sha256 = "1ginwysk4apjx2f045isidnzw863zrv272bdmzh247vi5za57c1k";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2023-09-12";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "8c910b2f84ae6acd9b4b17330bb94dd783c0c11a";
      sha256 = "0v6w5lm8f39yg9s3lfh15a2sbw8sr6pfiz6p83fmigrxncvb49cp";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2023-09-07";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "73682da41b74c9c35f33b1b2dbd0cc02cc59452f";
      sha256 = "061x7p90p1nmjf2fs4alrgyj0w0v8w6kbg2n86q2khl40w522ihk";
      fetchSubmodules = false;
    };
  };
  comment-nvim = buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-08-07";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "0236521ea582747b58869cb72f70ccfa967d2e89";
      sha256 = "1mvi7c6n9ybgs6lfylzhkidifa6jkgsbj808knx57blvi5k7blgr";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-08-31";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "ea7d7ea510c641c4f15042becd27f35b3e5b3c2b";
      sha256 = "1akghlyv0r49ir9xwlpwjaz895s2qfh40xhc6lby4lnmxwygbwvp";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-09-03";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "ebf6d6e83494cdd88a54a429340256f4dbb6a052";
      sha256 = "01z4xqb46xlycbv0w7akrf7rajy9rnl0jml0vk9dngblgcf1x2sp";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-08-26";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "5dce1b778b85c717f6614e3f4da45e9f19f54435";
      sha256 = "1yl5b680p6vhk1741riiwjnw7a4wn0nimjvcab0ij6mx3kf28rsq";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2023-06-23";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "44b16d11215dce86f253ce0c30949813c0a90765";
      sha256 = "1ny64ls3z9pcflsg3sd7xnd795mcfbqhyan3bk4ymxgv5jh2qkcr";
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
    version = "2023-06-08";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "8ee981b4a91f536f52add291594e89fb6645e451";
      sha256 = "03j79ncxnnpilx17x70my7s8vvc4w81kipraq29g4vp32dggzjsv";
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
  core-nvim = buildVimPluginFrom2Nix {
    pname = "core.nvim";
    version = "2023-09-09";
    src = fetchFromGitHub {
      owner = "niuiic";
      repo = "core.nvim";
      rev = "dc1046613c7a0ce664b6ec3d5c8c94d6b6d2618d";
      sha256 = "0lgg800rcrkg99wg7spj1r9ykyx31zr07f57ybyqaxwd7z0sx260";
      fetchSubmodules = false;
    };
  };
  format-nvim = buildVimPluginFrom2Nix {
    pname = "format.nvim";
    version = "2023-09-09";
    src = fetchFromGitHub {
      owner = "niuiic";
      repo = "format.nvim";
      rev = "d3eab66f7b7e76316bee61ba32ce0d35a335dd5c";
      sha256 = "0y4z1r5ps4ilrb99lac73bqib6q2jhi3vgdxw8y5v0lpvvfhx0fd";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-09-08";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "defad64afbf19381fe31488a7582bbac421d6e38";
      sha256 = "05ihrriym44g01rryaah2h2xnl183dpwcsf8q8rxzr29z0jpxxip";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2023-06-16";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "6be1192965df35f94b8ea6d323354f7dc7a557e4";
      sha256 = "1j47gcybag2qk87qc4karwdvzhvi485x7m80n2sj27rrh1fyv972";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2023-09-02";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07";
      sha256 = "1c0rkdr0pjrrplvr5adnb0q9vkq11kr7m5mvlggm633g45khjw5l";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-08-30";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "bd103502252027434ec42f628d2dbf54821d4ce6";
      sha256 = "030z020v4g140a72mv1q7l6bshhrkgisbd6w3hiwlv9a1mgz4bbc";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-08-18";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "1c2ef599abeeb98e40706830bcd27e90e259367a";
      sha256 = "06j190qns6fscxp7mnr6zl5bipzbc4w478z5x5g2awghc0iwzkcr";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-09-03";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "7f1e805dfc001d5dbb7d894105063f463f6c7dcc";
      sha256 = "1hy5a30pb0cv93dh796lh08p5k43b4b732sr4ka0pwj4n4a3q82r";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2023-08-22";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "9637670896b68805430e2f72cf5d16be5b97a22a";
      sha256 = "01h49q9j3hh5mi3hxsaipfsc03ypgg14r79fbm6sy63rh8a66jnl";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2023-07-24";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "1917bfb519729dea7b4f5d13aa9c810c9579b0ea";
      sha256 = "08brm8by7fzwqzgzcgcrzk7vq1dmknh5r4wxisc725rwkxjzmfkl";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2023-09-11";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "0427b908ebefcb3701c7f2cfbdafa37d11afe71a";
      sha256 = "1wxrwl530kxm8k8ymgk3w77av770ndr1hhzfk315jgl2p5hqmqm0";
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
    version = "2023-09-12";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "907ae8636016aab2f283576fc60d46ca3427e579";
      sha256 = "0v2ikhhqqxrfzp6wnqcszazq3zbmlf1g3n1jgln459bsyj7qq00v";
      fetchSubmodules = false;
    };
  };
  nui-nvim = buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-09-06";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "c8de23342caf8d50b15d6b28368d36a56a69d76f";
      sha256 = "0na7mi192alj1pyskdyivn12a0nmcmzy79kmqxyz8r1cijgb33q2";
      fetchSubmodules = false;
    };
  };
  nvim-notify = buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-09-10";
    src = fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "94859430020f5cf32a1b97ddd9e596fed9db7981";
      sha256 = "04fcm8277csv8davwirndinm0cpnb5h8azr2cxnw1szgqry2yh7k";
      fetchSubmodules = false;
    };
  };
  noice-nvim = buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-08-30";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "74c2902146b080035beb19944baf6f014a954720";
      sha256 = "10sjrxvnhrx1bi77lcdn5qz9kww4qcanajqzp2v8d3jlm5p2cc2c";
      fetchSubmodules = false;
    };
  };
}
