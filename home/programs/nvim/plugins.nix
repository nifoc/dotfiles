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
    version = "2023-04-10";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9ac3e9541bbabd9d73663d757e4fe48a675bb054";
      sha256 = "0d3h8kjid7mkqzdhakbf9wiyj1vxrcw4n8dp678bxm0452n82vxl";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "e283ab937e0197b37ec5d8013e49495193407324";
      sha256 = "1njshr9y24915zqj8msv9drfc1hicwry5hsrxh0yjk9hdwianq94";
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
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "412583be00797acbda63885bbf0c098485688156";
      sha256 = "1gbv5dgn2iahpdcfgqpa9gcffhs9p6vm0w21qh5n82yl8va5axbw";
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
    version = "2023-05-18";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "2950d4826fb92ec3b56c59b5d4f2d575a84cb3fa";
      sha256 = "129bl09h8v96h5qnsmqn6j808gyb6yx9lzh49dqh5g20dk031yvz";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-04-20";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "26d04c8ced02f02207e7aec1d5730c3a9ebadeeb";
      sha256 = "16z6rzay9sn011pl1ljjqs2f2k7igzzyqg9k6dyzzxjb3k1037rl";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2023-05-21";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16";
      sha256 = "1jn0dhzp9yjy6f4qgf6khv8xwpzvns30q5g69jb5bpxg900szjr1";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow2 = buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-05-14";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "a1e460f126db0bc3dc9e0cbad157e5671ffd2046";
      sha256 = "0dxginbs2q8p2wfqi3rl6zs9zi1arbdb2kcqbljxcfs1ia36x3qr";
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
    version = "2023-05-16";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "40c31fdde93bcd85aeb3447bb3e2a3208395a868";
      sha256 = "031l1kdny2l9g9mh59h8pskpmj2ps1p7p8ypk1dymkk30a1a9vw5";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2023-02-05";
    src = fetchFromGitHub {
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
    version = "2023-03-26";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "231b5ebb4328d2768c830c9a8d1b9c696116848d";
      sha256 = "1qvn1yamhv6gvbxgmin1yi3rqnmx1611gslrddhsfjkzc246pyzz";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "10142ff298f5fc3f8bf9d277c806593401b0fd06";
      sha256 = "13g2ml4hvq9db9bw1ahlx1xaz88ql4ryr4z916z153mmk53avs0g";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-05-08";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "355de7458fd63ccef9c6485d952ea118ba2cb46a";
      sha256 = "16319zrfqdxml6sl7jf7bf15ia9v579ihanba7bqfby6dbw6c40f";
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
    version = "2023-04-23";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "e03f2656d9d7c80929bf47f5ac71a5f23183510c";
      sha256 = "002h2phjvnd2q05ki3y3syi1pi3fqj871df9icljmgaqxhj4prdc";
      fetchSubmodules = false;
    };
  };
  comment-nvim = buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-05-03";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "e1fe53117aab24c378d5e6deaad786789c360123";
      sha256 = "13ypypkb63j8spg9av9i7n0yp0g4d1hwrym0f9659r0kxmzy9h88";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-05-21";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "fcdaa4313305fe20d928551134c1ec2266e7af2a";
      sha256 = "11q8pk1h8fwzf3mhc41c84gpix3hib76v1jpksj73xhzxzsdrh0b";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-05-23";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "ef6547d2f586e08e071efeebac835e545f3015cc";
      sha256 = "0xjcnx787kc1xc259czwn6masym2v2r4ixjb772cb3lb5bn9v73q";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-05-17";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "3ac8d6cd29c74ff482d8ea47d45e5081bfc3f5ad";
      sha256 = "16hg3yijmdpnk8rh9410y9xf1bns4jbcghc9q92pqj4q68bq9zp7";
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
    version = "2023-05-01";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "7747bbae60074acf0b9e3a4c13950be7a2dff444";
      sha256 = "0j0kpy379yhcv35l4jby5qyzqfpckwy7s09q0cc8sla7n1i1b00j";
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
    version = "2023-05-18";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "b8eca3b588e41e0bb1b3ae200fae88183b91a76d";
      sha256 = "03vwwszjrirrlnvh2gk95p31ps9ylhz6hms7g4by3rvab90av7p2";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "9c5237bab44a269677698245a30c7f0d669a8e7e";
      sha256 = "1frvy9ijpqc9lvfqjqqh6rakc2rk224irrliap7gz8abq142qkb4";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "26b5067c3b56815eafbf41b7b830f1ab52819a45";
      sha256 = "17r7klq852wq3kwhjlpc6a5k6d6h4bm8rf9ivjxgc7b4whiris5n";
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
    version = "2023-02-20";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "018bd04d80c9a73d399c1061fa0c3b14a7614399";
      sha256 = "1ncpar0n8702j5h4a2bv8zx9kcg7gwfhs52qqrcg1yfsgjzb86bl";
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
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "a44313fb28ed9bc9837c2b99dec1c6eed3a4f47f";
      sha256 = "08hhwn9inh5llvdx9qb7ics8pz69q16218lfdrllbfam1km5sg4q";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2023-04-10";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "cef8de1ea2f2faf3964f2d017cd88a35e93c9fe3";
      sha256 = "0x4l1lypyrcj2w5nx6khjpw7myp225gd0y9wfb2x98d1ymln5j83";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-05-19";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "c18b7ca0b5b50596722f3a1572eb9b8eb520c0f1";
      sha256 = "1nghas0n89z0i5h4h3p4597zh20x4najax1vlzbs626cyd0rmwsw";
      fetchSubmodules = false;
    };
  };
  nui-nvim = buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-05-01";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "698e75814cd7c56b0dd8af4936bcef2d13807f3c";
      sha256 = "06dksyx01ibl79s44rqv4np0j94ihqs30zq9x9rvkisq1a2sqlf1";
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
    version = "2023-05-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "f5178da0097e964b37951a0ebc078fdcc14280f3";
      sha256 = "0gr3gfikkj0d0saazpvzdibnrxwdxc4waa633kqnmnzalqhwfa7z";
      fetchSubmodules = false;
    };
  };
}
