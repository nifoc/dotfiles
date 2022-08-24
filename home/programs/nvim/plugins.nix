# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-08-19";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "b842e16ecc1a700f62adb9802f8355b99b52a5a6";
      sha256 = "1q4ym3n98l3njs8qhiabvxc576xr7a5riykfcw6mh6vjkgs26jyd";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "0879befd7d30c14715767c3c795a52f4743fb32f";
      sha256 = "0ff5ijdv7zp4f9dsvm6amv8vbncpq3s1w0s6v5gyzgnw8n6x0imk";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "974d877cd3c7f7c41449788c3d99238aeabbe1b8";
      sha256 = "0zcqzxk5gkka1h24sr363zx7vb0k0088ayihmmcj719cyspci8qz";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-08-19";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "91897282189608125025e804912cebbc7c947ce5";
      sha256 = "1slm45scygcm1yb1sjzv0whxh4jzkd584m95wl2qxww1c05gqb3r";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "7f7371ad5af5d7bf7369f31a9da781e6c822a4d2";
      sha256 = "1y7w5r0ys8szzva8cz98gm0kb84iza517z7qn2g4f4iwini3c1w8";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "3e944f02ff8040056b44f6a9aed48842317b33ac";
      sha256 = "01hqzl14svlalsw42x34mfs6lskn6s4a0drrv2m26qkyz2apmz7y";
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
    version = "2022-08-25";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "727fc415edad27d2664866543a2e4788e10fd927";
      sha256 = "07sfv65457sj64ppkgl7hl3cc32hi57dyjhh5b9m3kai781qpf7w";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "3572ac4e148ca6ae162889a77f43b6b2a053745c";
      sha256 = "1q0mv8lcyx3ygpyq054qjg7srlwq1ij556z2b909y4f8wgqmdwfx";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "f92c6e16a09b22b969f02d23d330cff190b46914";
      sha256 = "0ilzi2603ysnlds3azhb4yqm5l71blqdzsvywq9hcf4cm9fg5m9a";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "728f38ef5b9d77f310fc9d56f87582c24111f793";
      sha256 = "01hly1jska3p2lq1bhrmd339pcsm2lin4q81kl4vhm9x9s4b34pf";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-08-22";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "04f90900f2a57938921fd25169c7f282e7eefe85";
      sha256 = "01swygai2p0ybr4zjzgzdv2r1i3z6qsxw95g9mlfk84v0rf7c62r";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-08-18";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "6227548c97d7bd7d2f5f0897814c16649fcce368";
      sha256 = "1rywcw65fk81didm7dxgpmssvik2s2na4smp5dssazr9qb99ryip";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-08-23";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "058100d81316239f3874064064f0f0c5d43c2103";
      sha256 = "1w1xf6ifqa371kjfnzdiffrhskjqgya5x8rnxp5fsyi0a5pflf0k";
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
    version = "2022-08-20";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "3dd40097196bdffe5f868d5dddcc0aa146ae41eb";
      sha256 = "0kfa0pw5yx961inirqwi0fjvgdbmsgw16703mw2w9km8313x17zw";
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
    version = "2022-08-23";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "b3976412a63b44a171824ac9e1b4595354d99d98";
      sha256 = "006h02bvlffb6z5m7b2nxlb3rbqd32xjdkckkgzfrbyvsjviflq1";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-08-19";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "0a18e10a0c3fde190437567e40557dcdbbc89ea1";
      sha256 = "11pxmmbm67ihzjcnclkcpq5jp643s0a3kqvkh5hz2hgnia8gls45";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "e59d5c73f1bf696c7de9fc13090a240d1ceb13f7";
      sha256 = "086mc303qq2igbibavri72l68spc4nrx0hl0yay6rb5n394bj2xc";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-08-23";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "e6ed975f8c34d0e35072d45d542cce12f48a8b40";
      sha256 = "11blzq72cw6d9m42wj1jikhnnfqc7yf3b2yaj04a29x2ngh5wwkq";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "48540cf24c1744c8f089099270fa8acea2672125";
      sha256 = "1wrnf8qcncf3gxgzqdic19i3hylcyl9774pflsmk0al4irzi7jxf";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "81d7a715637bcfdb9f375c200875f1622770d905";
      sha256 = "1c53mdm39b969cqyif5ljvkbrl3q4h9kqqhys1jnzphs18kzivra";
      fetchSubmodules = false;
    };
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "fd53af18ac66b799d6edbaa74431a7bc1be832de";
      sha256 = "0aj2l2v3xpmwcibvra9j0ycgyllfiy3fnrz6dxgi4r8mqj3nixgi";
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
    version = "2022-08-22";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "94444456ebd16c6876338adb61118dc9cf8c54bc";
      sha256 = "1l424zi8qzshlhy072fz9nfm75q8h5xskczgm101a584mlxa2gsh";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-08-22";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "1e107c91c0c5e3ae72c37df8ffdd50f87fb3ebfa";
      sha256 = "0qg2y796mkkisyab6br4p0d6blx8ispglpphpdlmf14hp9si56bp";
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
    version = "2022-08-24";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "df6fc96ecb082e08f51b5f99d4858b5d4b5ed93b";
      sha256 = "0jxh9s0i2v20lszn2y6vnh5gs3sv0zcjbwmmqxfckz51mxik2chh";
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
