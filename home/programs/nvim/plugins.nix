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
    version = "2023-04-11";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "4ec26d67d419c12a4abaea02f1b6c57b40c08d7e";
      sha256 = "18ssw6v60sy2lmb4dc11xz0vwkc4mw8fzbavvggadibjmbcf824l";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-03-03";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "47ce7ee2396fa3ee4fb6b0e0ef14ba06f9c9bd31";
      sha256 = "0x6fxayhyabag688r142bj10lilyg13ba65d0rbk9jcx1y4702j9";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2023-03-09";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "c4c794afd762a00ca543972e5b9e34ce9aa14a87";
      sha256 = "00nnnp6axlpp8g31g7yi1hzrk9pi6kgh2fm5bgxgl1ynfks45iqi";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2023-01-26";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "31a2099627cd1ef8898f442ee6a58c7400111395";
      sha256 = "0dykwmx1f6ack7nl4br7vs8algmj5yz5a8v3djbk62fx6alzjrq6";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2023-03-16";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "14eea5563234424e9a732cba2e8acb2e4e1f9bb4";
      sha256 = "0ak6hp0wm969y3xyyfrl21708pxh3svdmyi1xgxwdzizdf1ilnwq";
      fetchSubmodules = false;
    };
  };
  leap-nvim = buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-04-28";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "6f2912755c9c4ae790abd829f0cf1b07c037b2a4";
      sha256 = "1xakvx3sxg2l23bqm2r08pcybvi7cx79602dxra0iprr05wg3xzk";
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
    version = "2023-04-28";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "b8a0791eb435efc790755883cad166a91a4fe864";
      sha256 = "0ld5fq4d3rrnj445hyknp3cnnkh549z88ym0mlhs5cg7lw2cbcmk";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow2 = buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-04-25";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "1ffe68cdd594633dfee0762feebfef81ed6f1fbb";
      sha256 = "01qlrz7s681s0hl2ygg6qq7ysqr1yxz7y512f647mviv7c7aw3qy";
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
    version = "2023-04-26";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "713d26b98583b160b50fb827adb751f768238ed3";
      sha256 = "0g9ac5wp9vnj2qmwc4v6ix0pjsaqg0q5vk42wbyjjnkxa17f2y1b";
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
    version = "2023-03-31";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "8febc60a76feefd8203077ef78b6a262ea1a41f9";
      sha256 = "02mv85rhm3vmzm614dxc9v6qqsi25dcjnbkmzza88lr8as9dm237";
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
    version = "2023-04-27";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "427378a03ffc1e1bc023275583a49b1993e524d0";
      sha256 = "0f7jiryclg32nia7wciz58cj974jx5xhmiq43wcyidf7nfm62rwb";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-04-17";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "aa04fc0e4d8acbfa43efc6a6f7162b01987257a1";
      sha256 = "1jng1y8rwc90k3060rivbipd99d0q2s16dlwm2hgpy8yk3q6ngmk";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPluginFrom2Nix {
    pname = "lspkind.nvim";
    version = "2022-09-22";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "c68b3a003483cf382428a43035079f78474cd11e";
      sha256 = "0qrfqajpbkb757vbcjz1g7v5rihsyhg1f1jxrbwg08dbxpw101av";
      fetchSubmodules = false;
    };
  };
  nvim-navic = buildVimPluginFrom2Nix {
    pname = "nvim-navic";
    version = "2023-04-22";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "83dc174da915f9dbc9b51169e9b62a2e0d42b527";
      sha256 = "19lr5mlhnfd9s47mvhhkxl343slsvhw8ni5gqb9p11k1zznl2h9b";
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
    version = "2023-04-28";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "38d3b7eb553872d8866f14a0dd4fe84126068fce";
      sha256 = "1d1a2c864y24lnr8h1xsg9krrk9604vy5mawjccn2fzq9g5vg6z5";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-04-23";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "e77fa9ad0b1f4fc6cddf54e51047e17e90c7d7ed";
      sha256 = "0dfqfrq5gpyys11bxxsqpmi9ha2lxz0byqwbn7qyn7fph6dpwysx";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-04-26";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "631f79e346b0b3203d2ce3eae619ca8d612e5463";
      sha256 = "0ly8dpp2g6ls5cxwhwb2pwihn9ivhc0amb9h33lfchs5m6ps2a7b";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-04-27";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "11102d3db12c7f8b35265ad0e17a21511e5b1e68";
      sha256 = "0wky0ywc1rr7gi2w7nynh8clnc4564a91rfjd6a2qhblq3v35dj8";
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
    version = "2023-04-14";
    src = fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "aca320ad601338c93eca50ab4c86fca964a18d96";
      sha256 = "17wcvqwddw4nlcpfvlaxxkcyl93axb1hqdcn73xb4c1yr8fdwaxi";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-04-20";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "7566a86f44bb72ba2b1a609f528a27d93241502d";
      sha256 = "0hxaqhvqd4446zvwbfs2l6akqbki2sag2vlxqfxbn1a9pdin1329";
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
    version = "2023-04-22";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "1e276be9306490e439784cf5e8abe1f93b4a41b6";
      sha256 = "0jwjnwrxm9abng03gxr9yp675s93n4c6m5yq71q5s14fkam5vr2c";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-04-10";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "8673926519ea61069f9c1366d1ad1949316d250e";
      sha256 = "0qgx7f1jkd62dxw8a0f4h01dbixzqmj18nmyh50baang671xzlzl";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-04-02";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "e6047128e57c1aff1566fb9f627521d2887fc77a";
      sha256 = "0568ac35dcqa73gv9gfv4wybjrg748v8cfvcn127k2ckjzq259jw";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-04-20";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "2aed06a3a04c877dc64834e9b9dabf6ad3491bc8";
      sha256 = "1sqhnhc749hm1bpy6s49w8jb3zpzj2azpj2hszn13ml1g1ps5iv7";
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
    version = "2023-04-24";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "68fdf851c2b7901a7065ff129b77d3483419ddce";
      sha256 = "04lphxnwzlsacszdikzwipm8wycwzi0zyz1lvpqplpk6vrfbb58v";
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
    version = "2023-04-28";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "e5edefd9976039f5352e0c900f35206770b33a2d";
      sha256 = "1g3wh3zwa9ympdfglgxnnfwnv958dyl0l8jqi2an4kgabl6f5471";
      fetchSubmodules = false;
    };
  };
  nui-nvim = buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-04-11";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "ecd9def93891b9260b15b5fcef542eaabf4145c9";
      sha256 = "133qxi97km61kg0y465jbwwzrby1v5h663igvrqlj1n2syvwwmi2";
      fetchSubmodules = false;
    };
  };
  nvim-notify = buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-04-19";
    src = fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "159c6cf1be25a933f35e97499314c9faab55c98f";
      sha256 = "02v5n53397x9kyvgzky2kmzpmiq040ahk9d9k5j03l9ai7jdsj2c";
      fetchSubmodules = false;
    };
  };
  noice-nvim = buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-04-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "0f12ed399e79aa49f283aa954468b92be65e03ed";
      sha256 = "196lc9y6bfxivsfkck739dkr66arf3jgqgyaha34nc7mk9s0395g";
      fetchSubmodules = false;
    };
  };
}
