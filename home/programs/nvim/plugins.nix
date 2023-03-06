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
    version = "2023-03-06";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "b2060eac2fbc84e0637ea706378ff66451e7c424";
      sha256 = "1x31lcf20cq8bb2cwdvx1cmsa18m315ni70qxrx99gncab6vwkz0";
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
    version = "2023-03-01";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "2ccd52506dd0d9374c845e52b5373e901227639e";
      sha256 = "1nf1sls66k0k0qq4rp13i03l0msiina5six7ifllhk7xphh7zic9";
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
    version = "2023-02-27";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "6f41f4b74d9616908194318031d845dd744519a2";
      sha256 = "1gjbpmv255ps6axz5w262rnn066syn0j0mllahnn8q2vhzd97q44";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "d34680b16af977928228e57c68e5a162f1649e3c";
      sha256 = "1ykqzjakhpyr8znxilg4w0xgadkq3p93d6mkp3n4my886i6d4881";
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
    version = "2023-03-06";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "980f0816cc28c20e45715687a0a21b5b39af59eb";
      sha256 = "1w1n2z4qbp72nwg6nvsch1c4pzfsx19r8z11yqpqq19k4vky36vc";
      fetchSubmodules = false;
    };
  });
  nvim-ts-rainbow2 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "293e12e90f0928845582b9a3db7258eaa8e92a65";
      sha256 = "069nyc2bxi5wyvbnyqmdif2vqk7fv0kfgz3b7r7xgjf6s4kgw9yl";
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
    version = "2023-02-26";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "a3f17d3baf70df58b9d3544ea30abe52a7a832c2";
      sha256 = "136pik53kwl2avjdakwfls10d85jqybl7yd0mbzxc5nry8krav22";
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
    version = "2023-02-27";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "1c2e9c93c7c85126c2197f5e770054f53b1926fb";
      sha256 = "1q3lqngb54gnnbzvqy02lxdrzbmk9lyd2rl4q8caj3xx0wfbxlpb";
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
    version = "2023-02-16";
    src = pkgs.fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "03ff45fab0c4adad4d252e25b5b194e22caf5b4f";
      sha256 = "1mik7qwz16bgbfpr5lcsrgkrjwifk1zanzmsdbj416kxhsz90fx7";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-03-06";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "1a2d5f5224c65b0709bf5da0ccd9cad29272083a";
      sha256 = "1qhq71zbyz9idmm56wxq64k1i46dmn4n2cpjxmpawlab7m2wvi3c";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-02-28";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "db08bfb87300fca2db91d15b64ca88a62970fb58";
      sha256 = "0rybpdkcja0kadf9arwx6r33nj7mzmadq660w7jcni3niy7545sw";
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
    version = "2023-03-04";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "cdd24539bcf114a499827e9b32869fe74836efe7";
      sha256 = "1iwpfls99mibmp8s2zw21hngvhqhnj6v03ddrv17qd2pwgdaarm4";
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
    version = "2023-03-04";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "cadebae41e11610ba22a7c95dcf5ebc0f8af8f13";
      sha256 = "0v3ywf8cbv52h02dc04q5d59zxj3ag87rcgjxnzb7zz89kbb1dbg";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-02-16";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "6821b3ae27a57f1f3cf8ed030e4a55d70d0c4e43";
      sha256 = "1c3qrbjzz0kl1k1gjkgil0ni944ac80ps76rdhs9jd7chbn7l0sb";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-03-05";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "9b5be5e9b460fad7134991d3fd0434466959db08";
      sha256 = "03ki9l6mhs95992fg48gjima676kip6x189170alavn0jg4bc827";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "009887b76f15d16f69ae1341f86a7862f61cf2a1";
      sha256 = "01haswbnqmjb4lyg25kimy09bsnwf9dn78bgy6jib4fkhv598dpw";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-03-05";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a";
      sha256 = "0rx3k5wj5fx6s6chg0cpj85cdii9kmqn0yknsvl82gnv4nc480dc";
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
    version = "2023-02-26";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "891fad5829f91cbc3d0866f7abd028d233b8763e";
      sha256 = "0288iqk9rymsql0qnr9093qpadcwiqbd88grq25vkygs33czbif6";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-03-02";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "ab49517cfd1765b3f3de52c1f0fda6190b44e27b";
      sha256 = "059whyg91hi7abr14fg60pfpnm87cl1iqz31hfl5wiiwrfaa1fsf";
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
    version = "2023-02-19";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "3a48818a8113a502f245c29d894201421727577a";
      sha256 = "1hxsjs83i2rjkmhvsxrxk1y6as9xi8b5ji9abvwvb90p2a765987";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-02-25";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "4b30081d2736e09f90c890a8a7adfe4df36f5b36";
      sha256 = "1w6wv5mpw05hmx0p4y3r3nir81wwrp6alj23gjwrqpzcjhdvh4z9";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "8680311f6de05d45b010883db7cc1912b7f0d0e4";
      sha256 = "0svkczs2xiy72vbcnsbkd4jbivq1raspmy89mb6q3zz6b1r0p5rv";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-02-19";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "b69415d912d466db17b8ee1eb777cc7f776a9286";
      sha256 = "0pv320i23wwp58xy3lpiy4j90y6fl8frmw19nk0c8dy9c10pdg6s";
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
    version = "2023-02-26";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "31d38d11390bcd35a568fcc65a79b7d6ec89de62";
      sha256 = "1g134rc5gwrdpi2w3ab1k07v4spl5frimc68mkw7jx14ipwxf7q8";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2023-03-02";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "12d716b8e53ff8188af309a750d622edfa3eccb5";
      sha256 = "0g0i9v7plbbgz079aas5dgd39xyp7bkrlcjbvb5m1zx1f58vdrbb";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-03-01";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "3b6c0a6412b31b91eb26bb8f712562cf7bb1d3be";
      sha256 = "07r6qplvm4svc0cj4khsa83bc66dkrv93jbb1vg9l0v9h5ds8b9p";
      fetchSubmodules = false;
    };
  };
  nui-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-02-28";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "0dc148c6ec06577fcf06cbab3b7dac96d48ba6be";
      sha256 = "0gwbfrwki6mm6w5lvzh7g154m1g4c2kajbbhb0i37492kwc4syn4";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-03-04";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "281e4d793c550c866bea3fb85d39de1f0188fb50";
      sha256 = "0zdjhbyi2hg4cincnykp2xdhqzcg9213vyim5lrwqaj0wwvlakyw";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "c22651651da01239fc4afac4cdb7261797d5f02e";
      sha256 = "01zbk00di167npblpf126dqcsyc97k2w72nn88mkkhvhsna28x6x";
      fetchSubmodules = false;
    };
  };
}
