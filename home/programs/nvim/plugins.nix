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
    version = "2023-05-07";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "986875b7364095d6535e28bd4aac3a9357e91bbe";
      sha256 = "1p67hzk8aj8gzh4l6znizfbp0kwa2d0ba9qlnvgsxmvfw3iz8hgr";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-05-11";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "fa9bbb319239fa54c1b91b84c1d368d3c6427ffd";
      sha256 = "0w5w3zxgwdys7i5sl6l8mykjfgillsdc73d3xq6w6rzscslvlm1p";
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
    version = "2023-05-13";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "15300c1a10a3aa857c7925d854d58cce6e758d51";
      sha256 = "1xb70i0512a2l4z2vb7wlpi05v12cbsga398dzjrqm22h49w88w2";
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
    version = "2023-05-07";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "d77b37f4520e5fc2cf4c74c12e42ed4b589bd367";
      sha256 = "01i1dmlnx2303bv8ahgkmks8jsgz4frb6dxcqxh9xk1acsqzbi7c";
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
    version = "2023-05-12";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "df58d91c9351a9dc5be6cf8d54f49ab0d9a64e73";
      sha256 = "1jg6pqypw3pj6s9nxq6kh1r5mwxrgap79s5382a73xx0rwf4kkvp";
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
    version = "2023-05-06";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "b4bc24c4925aeb05fd47d2ee9b24b7f73f5d7e32";
      sha256 = "1fbjv2zdxn962hf3vxfl4s45yvqdr8israz5chw4w37jf8achqx4";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-05-12";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "1d0dac346de7c6895ac72528df3276386c6b149b";
      sha256 = "1nlbm7ji73ggg48pzvlbb32jfscnj71bgfzg4q1p3zfvssisz85c";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-05-12";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "d153771162bd9795d9f7142df5c674b61066a585";
      sha256 = "05xiyakckdc7185amr3fxr0wjsvdr94pah4wgnn0ysmzsh0smc3k";
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
    version = "2023-05-07";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "6c8909b682803d8c3a054259079f158a73a0e30f";
      sha256 = "0w6p1kpggb5hl5h7zz5s873dysdvhdn229dpl5m66g4c5j66plj1";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-05-07";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "35a60f093fa15a303874975f963428a5cd24e4a0";
      sha256 = "16yxsqa5ppb9p8l3r6j11ak6a5448l6wy9dj4ag58i0r18l0cfj9";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-04-30";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "219bd66585aa467b1c90fd01b54a2a423aaed4ab";
      sha256 = "0aximc9fiicmhxkqrazjsqfr9mqw7llnfdc778acn5rkhwj1xms9";
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
    version = "2023-05-10";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "814158f6c4b1724c039fcefe79b0be72c9131c2d";
      sha256 = "1sa50871l86fx1hyrhb07i03r1sjlw76zp30csf846n24vnnnjrq";
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
    version = "2023-05-10";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "c2a745a26ae562f1faecbf6177ac53377d2658d5";
      sha256 = "01y0nh8cdjrwcagcpw99sw55yvylyia4jphpprbyswrggg4r83fw";
      fetchSubmodules = false;
    };
  };
}
