# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-06-12";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "969f2c5c90457612c09cf2a13fee1adaa986d350";
      sha256 = "10nlz4hq1bqjsnj9pkadi3xjj74wn36f2vr66hqp7wm2z7i5zbq3";
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
    version = "2022-06-12";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "968a4b9afec0c633bc369662e78f8c5db0eba249";
      sha256 = "05x9hnz960ljcb2psqycxgdmh99j36y16vbb9l92wjv5szkz37x5";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2022-05-30";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "8d2c5337f0a2d0a17de8e751876eeb192b32310e";
      sha256 = "0jb25z0bw2xyix18pf59lrmbnih8yxxkb81xi9zl034k9l9cmsv3";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-05-14";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "cb656868828f772ce807fe61fd3476dfa8cab1b7";
      sha256 = "03kzlij00bnqxmc362wip6f5ak8b83wdbqxx570ndpwjlybrn3m8";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2022-05-16";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "7611e52cd27b3bd2f391c56352271d8d272fc637";
      sha256 = "14y95vxcaaq40bf8bf9ijx8plc5x627hj54m1k1si9a6wi60p6b9";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2022-06-03";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "0a9eec9e7a650396f42481a96e0ed1dc7553db86";
      sha256 = "1l3grsln0b7zyiiqjwbw83prqgjl7chzprgnwsmj3hkck65zhis0";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-05-23";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "e518433923f4ab4ca9b328d97e209d3ef18a4df9";
      sha256 = "1zh86cp41z7zxl005wzl7lv2mw9wcv62vhd3h582djy48bypcrk2";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-01-27";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a219971291c56bcca3827cb7bd40aaaef23feeca";
      sha256 = "1n8maj50szb49qhimsx3rg4hkqspk1gqhpzg2i8fnxm1218n2mdg";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-05-28";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "18cb3a45e0ff843d48e8637a36b9cc6cd89d71b0";
      sha256 = "0w8gzxps0rn20cr92ib5zk3xw6l2i8032081r0v34rry1xahdam6";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2022-05-01";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "71b00a3c665298e5155ad64a9020135808d4e3e8";
      sha256 = "0cn6q7885ffn0yxv6frjsa8yx6mnil8lmdvml8inj3lvakyprzc8";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-06-15";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "d96eaa914aab6cfc4adccb34af421bdd496468b0";
      sha256 = "0iwml8wk3mk1j8pff11w0fg0x7hihnz6d5wq1ki57fasycwd90a0";
      fetchSubmodules = false;
    };
  };
  telescope-zf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-zf-native.nvim";
    version = "2022-03-15";
    src = pkgs.fetchFromGitHub {
      owner = "natecraddock";
      repo = "telescope-zf-native.nvim";
      rev = "3f64df2cb1e8c4a399154b21dabb2734a1afb8f1";
      sha256 = "11fmsalkx4hx0vd28q0hvw6jcvnb8qd7f0y69f7rlbd2n0mh9vx4";
      fetchSubmodules = true;
    };
    nativeBuildInputs = with pkgs; [ just zigpkgs."0.9.1" ];
    buildPhase = ''
      just clean
      XDG_CACHE_HOME=./xdg_cache just build
      mv lib/libzf.so lib/libzf-osx-arm64.so
      rm -rf ./xdg_cache
    '';
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2022-05-29";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "541115e762764bc44d7d3bf501b6e367842d3d4f";
      sha256 = "0vabnhb5d8nc25ap9zixazmr4sm5ylq0iqzsc89cc3h1907xp6lz";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2022-01-19";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "98b1ebf198836bdc226c0562b9f906584e6c400e";
      sha256 = "02qjn45qpvxhw7zifw0a86alika5r8b5a98y1199jpdx2d7zks7j";
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
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2022-06-15";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "10c39343660594278599694e98290fb5e629c239";
      sha256 = "0qy9pv4bkpa1r1v0r3ljwf8ydwm8rkvamdycv31457s2ygm7zgi5";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind.nvim";
    version = "2022-04-18";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7";
      sha256 = "1c13ll09v16prhzgmv8pappck4x3ahhc5sizp6r61kb7k4mkfpfk";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2022-04-10";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5";
      sha256 = "192a6il56r4cfkqq67vh5kbdfa7vzwmh33sb8zy6zlri0a0h7dw8";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-06-08";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "28a5f3e24ccc9f70026629e9b87670ab893a870f";
      sha256 = "11dhxa18djf2rmbnrfm60z9pcmjnblha62yl6sc8d137fj87jppp";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-06-07";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "3c69bab36569d5d0321351ec956fc43a8d409fb0";
      sha256 = "0wfhj4i1ycwsdmpkk9jcfmq141mqlf40sl4ymqd0zqrwzb8yz5m5";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-06-13";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "79b2019c68a2ff5ae4d732d50746c901dd45603a";
      sha256 = "1mlzjccs8yp6xiffk05xrrqms8d3hmyyr31wysvmssv8jspy32k5";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-06-09";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "d27a83a363e61009278b6598703a763ce9c8e617";
      sha256 = "1l1swsdn601dbmmpp5fz5r0aqr2bq9fmhmrx33dfph946x3flafs";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-06-15";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a";
      sha256 = "0i6icap7x0p8f6i0vgrnqz2rhwc05qgsiflwndmca5dxarmxysxx";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2022-05-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "affe808a5c56b71630f17aa7c38e15c59fd648a8";
      sha256 = "1v88bw8ri8w4s8yn7jw5anyiwyw8swwzrjf843zqzai18kh9mlnp";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2022-03-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "8014f6d120f72fe0a135025c4d41e3fe41fd411b";
      sha256 = "1k61aw9mp012h625jqrf311vnsm2rg27k08lxa4nv8kp6nk7il29";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-05-01";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "a9de941bcbda508d0a45d28ae366bb3f08db2e36";
      sha256 = "0mh7gimav9p6cgv4j43l034dknz8szsnmrz49b2ra04yk9ihk1zj";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lua";
    version = "2021-10-11";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lua";
      rev = "d276254e7198ab7d00f117e88e223b4bd8c02d21";
      sha256 = "11mhpb2jdc7zq7yiwzkks844b7alrdd08h96r6y7p3cxjv1iy5gz";
      fetchSubmodules = false;
    };
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "2022-02-02";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "466b6b8270f7ba89abd59f402c73f63c7331ff6e";
      sha256 = "15ksxnwxssv1yr1ss66mbl5w0layq0f4baisd9ki192alnkd7365";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "2022-05-09";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "12463cfcd9b14052f9effccbf1d84caa7a2d57f0";
      sha256 = "11fbxw8rrhypazd256qwjvf8gg0laqb9b4h9yqdgvwj810y6n6wg";
      fetchSubmodules = false;
    };
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "2022-06-09";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "c2886bbb09ef6daf996a258db29546cc1e7c12a7";
      sha256 = "1ar6d6pqybn4vqynbh18mc7fy1ybv0s9mi1r2j1nfcmgvh4wsvwk";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2022-05-02";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252";
      sha256 = "04h6np207781l3wa36l6nqd56lx39s1kycf4jvclgfrr6ddnbv68";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2022-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "c3f0086ed9882e52e0ae38dd5afa915f69054941";
      sha256 = "1jprb86z081kpxyb2dhw3n1pq15dzcc9wlwmpb6k43mqd7k8q11l";
      fetchSubmodules = false;
    };
  };
  neoformat = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2022-06-02";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "e8ce68ba5b57df18b54b96adb80ad533c7a2eb3d";
      sha256 = "09ylazsa933dqhx0x9qc4v2ackqvr22dpzbgyhkvqfs476fj5pn4";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-06-15";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "fa6876f832ea1b71801c4e481d8feca9a36215ec";
      sha256 = "0qm8x6ay9zy2pd75wrz2v470094s4k1wvp313793v07kh2k40qsm";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2022-04-22";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "044a05c4c51051326900a53ba98fddacd15fea22";
      sha256 = "0c94vnhl216p36x19cplhypr1b3z0f7l5jdr19hl79qvdfp9djk2";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2022-05-29";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "976ebfe61b407d0a75d87b4a507bf9ae4ffffbaa";
      sha256 = "182lzlbjfplvhzw36rsizjhjcnhkddswm0yydbqg3gjdxs7y5wdf";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-05-23";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "b1e850b77e57b2720c06d523d6fc4776ad6a5608";
      sha256 = "070ldvra2xmg76nvx1xa5wx2pmfrfmjqbhxy2qpr6nyj0cbb5ndg";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-06-13";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "9528fff53c9cc17776f0b5f4b90223771fb1a1cd";
      sha256 = "1kk1dfskjflqznby8kgy20fqc4ss2khcbzhjzksmqg4q09l0bgjn";
      fetchSubmodules = false;
    };
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "2022-06-05";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353";
      sha256 = "03sf49s26nb9aqr16f776p58vs3dx9kyyach2jj4k1lp318w6ikp";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-05-24";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "6177a59552e35dfb69e1493fd68194e673dc3ee2";
      sha256 = "1bsyzbcj9jmpx6sl6mf2f5k1a60lhgq7vmsrpqab2wc0vm4v8kap";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2022-02-24";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "29db24c5e94243df1f34f47bbcb4e7803204cae4";
      sha256 = "05v1pddjp9050idp0rb8fyz8gdh00r3h7py4glg3n6r0b01hwlka";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2022-06-12";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "aaeed9e02167c5e8f00f25156895a6fd95403af8";
      sha256 = "0r1c361kg6xvyx785vjwang9qf1i7laaxh7bwryz76pb0byi80c0";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2022-05-07";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "92a6ae6f33839222ce4ea58f5cdaf0a3f235caca";
      sha256 = "0y3l0py0cnvj876xi5kgc7mmbycj7s61mj29ipsmn9bnjvk008yb";
      fetchSubmodules = false;
    };
  };
  neogit = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neogit";
    version = "2022-06-09";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "0ce803d22e361080ec0daf6bee7aad45e8cf8b07";
      sha256 = "0qh359k6x46na0raqrp5wkc7c25lsgsr5y35i0r426xxmr029kn8";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-06-10";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "c18e016864c92ecf9775abea1baaa161c28082c3";
      sha256 = "1k7483zg5gn06db0xv12j72wywmaxv0qqm6j3v65kf2g0vxamday";
      fetchSubmodules = false;
    };
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "2022-06-03";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "430a25393abbf482bddf03c224cd5b8eeb27b5e1";
      sha256 = "1cypvpyaarn9ckin2cgf2hpsq5qj517pz64imvyckzg22x9cf6yi";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-06-10";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "896026933d42d7e37854ce7be44ca3ad1b4b2dd2";
      sha256 = "023c6zngai2fw8k4g3vgqyy6rnvjy366d9hkc6ff0rhijq2iyyb3";
      fetchSubmodules = false;
    };
  };
  nvim-visual-eof-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-visual-eof.lua";
    version = "2021-03-14";
    src = pkgs.fetchFromGitHub {
      owner = "LumaKernel";
      repo = "nvim-visual-eof.lua";
      rev = "3c001c6cda4db5bf62ba33344e61e30230acd9eb";
      sha256 = "0mm4zadcl9fkqwxb8kvzfspach2vxxpr3kzgnb3z3ry6zl5gcd3b";
      fetchSubmodules = false;
    };
  };
}
