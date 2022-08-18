# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-08-09";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "49f4ed4a96e0dec3425f270001f341f78400fb49";
      sha256 = "06l6d0hrpsh0jxapf2j5d2hf5km5sg8dysxiggz3mhh4f1y5jlhy";
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
    version = "2022-08-01";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "31807eef4ed574854b8a53ae40ea3292033a78ea";
      sha256 = "1vkyqrk0shpc076rq1s7rwldmcmw2k96hcpifligrsplr170kkhv";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2022-07-05";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "2d02a56189e2bde11edd4712fea16f08a6656944";
      sha256 = "0f7r7xza28aaf60nbzaw9fcsjjff5c67jmgbci0jz21v2ib89pps";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2022-08-16";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "6ebd6f3fec198b7b4d7aedd2b0619cd05ebcbaac";
      sha256 = "0jqglb3cpc5lrdxk5zpq7wpbccp94xydxdqs75r0mi9619lx9jkh";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-07-29";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "d55f095b472a3d0355d3b7c5c84d4774ee769a7f";
      sha256 = "1zj8dvyb2486kpim4vlmrpsyga2hny20q1ya9rmqxfnsahydpmnz";
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
    version = "2022-07-10";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "a2307c36b2504feaa2664acb6fad5f39bbe123d4";
      sha256 = "1z5cxq1hkcsz06wvvz4wzrfq199j008kh3pmbcy9s44pkmyzjqc2";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-08-16";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "e4290dd002060d1bd00ec32cfb0bc4e78cdddd76";
      sha256 = "09i5jx49ylvjm4nnsa475hs7admxgh640aw2z17r4nnf93j5la09";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-07-08";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "40d38e95bf006470b3efe837b2e0b9f66707c850";
      sha256 = "0fj5855j2jmpxlgh42jpaq0jwfcbd3sj3agl83nl17kx5y5xia4h";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-08-10";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "1e904f6d1b41adb9d3b87df2108dc4a315a72379";
      sha256 = "1x4mfq63z7fxg7cyv2dmhzy7kxq9xgz16cvfj69gxz0mqxmmg3xz";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2022-06-22";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "ce7e4b757598f1c785ed0fd94fc65959acd7d39c";
      sha256 = "0r3pjpzwjp1m563n80qp93y7f8gvpqjzlhsrd0hvi67qzm6pj87f";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "8d13f4ca8a449d9bd687234b4cb7c531c50b0fa4";
      sha256 = "1nrbqrdbbji5sx44ir913vf1vin9xl45ss6fyhczdc1mylsicr5s";
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
    nativeBuildInputs = with pkgs; [ just zig ];
    buildPhase = ''
      just clean
      XDG_CACHE_HOME=./xdg_cache just build
      mv lib/libzf.so lib/libzf-osx-arm64.so
      rm -rf ./xdg_cache
    '';
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2022-08-03";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f";
      sha256 = "160cg0mhhb87sibdm05pqsa2p3vy110i6aw29dv7mbz4jaf6xhrl";
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
    version = "2022-08-09";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "da7461b596d70fa47b50bf3a7acfaef94c47727d";
      sha256 = "1bahbla28qx4vzkdfbncws22qf0pr4kkra0df52sca245xzgl605";
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
    version = "2022-08-09";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "27f6ef135a88d9410a33cf92fc47f5c018df552c";
      sha256 = "1s4paj5w5g2frrkp4zgh0i3r1h08jakhrs07w7shjkb4iqxhbyi8";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-08-15";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "688255fa5d3d5c3f26f5c9709e785fe71dec39c5";
      sha256 = "0a5fdmq90nbsv3dk1q6j3kmgcncy2s56xik4skxarkkz541lf7dm";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-08-17";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "ae8c440fe98c65f3a941d6fc6de75538c5c1ecde";
      sha256 = "190l3v4xncj2wy13nic7sdiy2005j579ga3n9qwys73s9hip1xlc";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "a96cf3083934c794620d1e1ae2a7578f61b7dc1b";
      sha256 = "0kdrvhpzajz08kyplb1h1vizs0jnvklsx0b79jga9zw2f66nci5k";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-08-15";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "b2446100d9f6609526cf1839b4ce3dc1ff07ada0";
      sha256 = "1h4nm9h18ym7qy7bqwxk7knbjbhy430d22ycgibbd3frk89lv5ap";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-08-14";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "b1ebdb0a17daaad13606b802780313a32e59781b";
      sha256 = "12lgg51b8pzfqxkz5h6726lbw4g50kl1x2wgh39hs79q04ag083l";
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
    version = "2022-07-20";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "57c4db7d3a663bd31ef60c4b5ed32683301247e9";
      sha256 = "0lygd43zfhss9kirlhfc3rq95m0hdkk3cxc85nlfr2xx36plrarc";
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
    version = "2022-07-26";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1";
      sha256 = "0nmxwfn0gp70z26w9x03dk2myx9bbjxqw7zywzvdm28lgr43dwhv";
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
    version = "2022-08-05";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e";
      sha256 = "0aadafmcbf23pw6swwfmbj4hcp4gawshz2ddhzagxflw398c0n9x";
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
    version = "2022-08-15";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "c7f4580019ea5f001a7a38734b03b6cb29743b4f";
      sha256 = "1x9wcmwzrv4yzz09qflyhzmchcgvpsx35x95llwk2hj1xp3l4s7p";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-08-16";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "a7a8be3d2f2473300d070293903ac8b95edeccc1";
      sha256 = "1q8d80la2qkyhpwndns7ay5c69iggivx93wy46kg8yj7g5hz46p4";
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
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "87b8e9018f68a4f347b8dee66653e7007ae5308b";
      sha256 = "0gljlxbz2cz2fcindbzx8lmrsach8sg5r0nfmy7rqwl8v88bkyr3";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-08-16";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "4234c446d14370b3cd7604bd8e2e51ae2680f5ee";
      sha256 = "0ifa4l0l1pl268w4w3mwhbncxi5bd7n3yb0j3vikjhz567kwqfz2";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "7f7ca045648912c03f565e91e2b6ba91e85b9a33";
      sha256 = "0q5g5bh4wf6yj8zfr0rwisf5xy9nci6clxssh9cg8wq5f703nswc";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-08-13";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "5b5ef268a80c2c241f16b03268b4498f214ecf66";
      sha256 = "11j8zdrrdpy2c1j3pkr8vdfwsm2jb12lzralfk9k1pmlln06gxq3";
      fetchSubmodules = false;
    };
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "2022-08-17";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "06eb4ad9486bd13440ffea243ea83d314f4a8e7e";
      sha256 = "1chrq34v657jbdbkg5l2vyisxb5h2mvxrx9hwvvwgiqlzyvksivp";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-07-27";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "c15bbe9f23d88b5c0b4ca45a446e01a0a3913707";
      sha256 = "03l28ja345vz4hrbj9ha864vfyagid116mqi4z8ka2g2nk7s1brd";
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
    version = "2022-08-13";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "62683d927dfd30dc68441a5811fdcb6c9f176c42";
      sha256 = "0ac58nyl9lk1wxr9g2jkckxzjr2gfahpidg983bjdl3mk42qc4d6";
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
  diffview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "diffview.nvim";
    version = "2022-07-20";
    src = pkgs.fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "a45163cb9ee65742cf26b940c2b24cc652f295c9";
      sha256 = "0vp6id3lqhvn9db5hd2bml5xfsmcy65hn19wbl82pscl6vqx80n4";
      fetchSubmodules = false;
    };
  };
  neogit = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neogit";
    version = "2022-08-12";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "05386ff1e9da447d4688525d64f7611c863f05ca";
      sha256 = "1zarnnv3qh7gq3q5vd1r68vp6h26a1jbfqvg6hjwssb1ilaxzidb";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "16e5ecc5f5ddf89dc287b4caece9abc9f7ebb506";
      sha256 = "0lkzklf8nqdxflkcb32ypyfxdc39bfjyi712cxjq1i3arsvqls1n";
      fetchSubmodules = false;
    };
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "2022-07-09";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "eb74c4b1f4240cf1a7860877423195cec6311bd5";
      sha256 = "0qajg4kjwlwbxjjms580v5aisg1vjid4vbmvzwk6nsfms8nrzn18";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-08-02";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "60bb6bfd6992549ee5336bbb761705b62797ce1d";
      sha256 = "06wyk09y3yykp4njxqxl211v508xw4qm4q987gz609xdd5n8x15d";
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
