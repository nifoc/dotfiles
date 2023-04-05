# This file has been auto-generated
{ pkgs, ... }:
rec {
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
    version = "2023-02-19";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "253d34830709d690f013daf2853a9d21ad7accab";
      sha256 = "17vvl06jc5vrfrv7gljflkqykshhg84wnhbl9br4pm050ywlg4ng";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "0568104bf8d0c3ab16395433fcc5c1638efc25d4";
      sha256 = "0s3bn0m9lml0b2b82zl1c7g7idrzbb7jhi7yf24cm5rl457iixp2";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "47ce7ee2396fa3ee4fb6b0e0ef14ba06f9c9bd31";
      sha256 = "0x6fxayhyabag688r142bj10lilyg13ba65d0rbk9jcx1y4702j9";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2023-03-09";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "c4c794afd762a00ca543972e5b9e34ce9aa14a87";
      sha256 = "00nnnp6axlpp8g31g7yi1hzrk9pi6kgh2fm5bgxgl1ynfks45iqi";
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
    version = "2023-03-16";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "14eea5563234424e9a732cba2e8acb2e4e1f9bb4";
      sha256 = "0ak6hp0wm969y3xyyfrl21708pxh3svdmyi1xgxwdzizdf1ilnwq";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-03-14";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "f74473d23ebf60957e0db3ff8172349a82e5a442";
      sha256 = "1fjc3b4czlndd1nfn5n2zwlx51xhxcxiysjipfhnbbqhpy4sqfbg";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-03-31";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "8653e7699810b63bda8ef267055cb4d4237670ef";
      sha256 = "17r785dbnn87qg35k3dbvlaszfb29nrv5l0703c1i69armdf1k3z";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2023-04-05";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "411e771d511442ab81670701f5c830f6c74aadd7";
      sha256 = "19843p5chl4lr7lza6bzz3xrgbmgjqs0v6q8zgqk6pd9q23gbwbx";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow2 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-03-27";
    src = pkgs.fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "51d835d411df45b14b9531789eff0c590cabf018";
      sha256 = "0c8cy8bcmbn7lrr7ld9l5iss4k6hccn4m1mp25zx3blmwz0xi01d";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2023-02-17";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "4044b53c4d4fcd7a78eae20b8627f78ce7dc6f56";
      sha256 = "11h0fi469fdjck318sa4fr4d4l1r57z3phhna6kclryz4mbjmk3v";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "942fe5faef47b21241e970551eba407bc10d9547";
      sha256 = "0i9j8fm5739vqzxnpvifsyfggw7xlpf77nk22l500qpw4spksb1b";
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
    version = "2023-04-04";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb";
      sha256 = "1md639mcs3dgvhvx93wi0rxiwjnb195r9al9bfqvcvl3r307gxba";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2023-03-31";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "8febc60a76feefd8203077ef78b6a262ea1a41f9";
      sha256 = "02mv85rhm3vmzm614dxc9v6qqsi25dcjnbkmzza88lr8as9dm237";
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
    version = "2023-03-26";
    src = pkgs.fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "231b5ebb4328d2768c830c9a8d1b9c696116848d";
      sha256 = "1qvn1yamhv6gvbxgmin1yi3rqnmx1611gslrddhsfjkzc246pyzz";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-04-05";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "7179a46c2345050783d14397e672e7b152a7af4f";
      sha256 = "1vm24x1rbmjsbb6ykbvqsz4y1pbdxb3gainzrv0z6q4xfz0y4ira";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "ffb8f63689197b845c2388f0df5f0d1bd21c968f";
      sha256 = "0pxz9050522vlglvwm67s43dniwxygynvi0f8qdd8dhb5zm9x65q";
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
    version = "2023-04-02";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "27124a773d362628b114cd12016e743dab4ccf3e";
      sha256 = "0xv2y9kw60cjk5n8h91s679rc101lhaal9ds5fmxgj4sl19jf5fn";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "a2907275a6899c570d16e95b9db5fd921c167502";
      sha256 = "1i2s3d9c0c31pv0y0iljqk2s3qcqanjw84w81ww2dnnh31qgglpi";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2023-04-05";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "2a9969a09d8456104d7954b67ee6667d6645c71a";
      sha256 = "0yy9kwl2xkg38xl7rsjz9yz3w99md2ywj2w3whlv7hwk0w0pirb4";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-03-10";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "8d3aa5c22c2d45e788c7a5fe13ad77368b783c20";
      sha256 = "0qxzy4dr9cr5q59yi7mw883id51zpb3mnrv6r0aqh9flswkljllr";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-03-27";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "bc8ec05022743d3f08bda7a76c6bb5e9a9024581";
      sha256 = "0iicqy737w0zqgdx5hw2cdnzw7qks5scmnr0s8ssvqyw3zzym7b9";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-03-26";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "8d91ba2dc2421a54981115f61b914974f938fa77";
      sha256 = "0j45scar2frdk3a31lsc536z5vyzwanpg3nn89awp9idzhyviwys";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-03-17";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "777450fd0ae289463a14481673e26246b5e38bf2";
      sha256 = "0a8jj0frf2rb7dwx35157kp4iaiij2ad0azicw3i11bb4qicd08a";
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
    version = "2023-03-26";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "c8e3a74b51597d69d240085a258636972ce98e15";
      sha256 = "0xb4bvh49z26cpi005q6ma0mv9mw49npcrayvd3c6pcdgr148p5p";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2023-02-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "8fcc934a52af96120fe26358985c10c035984b53";
      sha256 = "1bhhna3f1xzf6y7q6iq9v2369w0jrgnh0hngnw84wh79pknqsgb3";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2023-04-01";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f0f53f704c08ea501f9d222b23491b0d354644b0";
      sha256 = "1zcplbb2kkq3f9mmy6zfgscdiccqiwkjr4d91qqjxp80yi1v9z4j";
      fetchSubmodules = false;
    };
  };
  neoformat = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2023-03-31";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "e18e0cc2641dd78f0cdb0ddd575843045d672dde";
      sha256 = "0vprb47wcpwnsij6iyxzirfkcbzr4jaj2cc8flb41d42lsjr0mnj";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-03-26";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "0fd6519d44eac3a6736aafdb3fe9da916c3701d4";
      sha256 = "0ds77blb357mamxsjhhp8cj6mrnpvzmk3p0w1cy3wdikmbng940v";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2023-03-17";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "25698e4033cd6cd3745454bfc837dd670eba0480";
      sha256 = "065j0188x7j72sz14i3i7q0vxfjbl5xz3566nybghcnqmksp9m2w";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2023-03-25";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "156367e4cbd123bc9a70eeabeaa16f7cf9239e12";
      sha256 = "19jh4s9fv40q9vy1lykh0zv5qv225zs48wgskd7b0xq0gh2c9vcz";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-03-27";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "b55fe6175f0001347a433c9df358c8cbf8a4e90f";
      sha256 = "1kip55hxkg6lgbqj37hx5fsph5j4c69r7n6c7ypqynhn7qg6flqx";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-04-02";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "e6047128e57c1aff1566fb9f627521d2887fc77a";
      sha256 = "0568ac35dcqa73gv9gfv4wybjrg748v8cfvcn127k2ckjzq259jw";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-04-02";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "750a112a1cfaf2a7cd2d67a2d67f8f463b00d8af";
      sha256 = "19lip656xd59vk6ki1aryg53105zakp39x1llh3qdlmrk7w7g5lz";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2023-02-20";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "018bd04d80c9a73d399c1061fa0c3b14a7614399";
      sha256 = "1ncpar0n8702j5h4a2bv8zx9kcg7gwfhs52qqrcg1yfsgjzb86bl";
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
    version = "2023-03-31";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "b86982429325112d2b20c6d0cc7a5c4b182ab705";
      sha256 = "1md3j9865lq4xc3ai0k8h8jdwpmqk82d7j33zrqlpak83ys8mbgk";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "e92d99f062685f9d3ab84238e1cdde6399dc64ce";
      sha256 = "0ahs5sgs95wkpr11s93r08w0xagiqrfw5zrgqyhhjqg2dfpqzxp9";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-04-04";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "372d5cb485f2062ac74abc5b33054abac21d8b58";
      sha256 = "0wck04ja0i77g1acidfrb3b44zvd8yiywlqwa64ji0isxl85aicx";
      fetchSubmodules = false;
    };
  };
  nui-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-04-02";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "1f43b13d133eb4b4f53a4485379d9afa58808389";
      sha256 = "03vvpqdg88vz3amq62bfdzslsykbm7nafvq6cf6ggazd01rc1zsj";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "50d037041ada0895aeba4c0215cde6d11b7729c4";
      sha256 = "0nzqj6j9j0cvi0mckqggfgyc8a6cdyr6z2qwkzk30yqjs39fnh66";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-03-26";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "1da4edfba3e9278e98fc9723d7235d9ab3889744";
      sha256 = "18y314k7da239w05rkxz6nqjljjx24mx9kx5020bkkx80q1z57yk";
      fetchSubmodules = false;
    };
  };
}
