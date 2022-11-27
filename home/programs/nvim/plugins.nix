# This file has been auto-generated
{ pkgs, ... }:
rec {
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-11-12";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "d3dd30ff0b811756e735eb9020609fa315bfbbcc";
      sha256 = "04wv6hzmdwcd563kl68n33yyyydhr0rdbjc93874dlh2nlfm7ixn";
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
    version = "2022-10-01";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "4b7e52044bbb84242158d977a50c4cbcd85070c7";
      sha256 = "11815h0h2mf5ym282ghk7xav90635r88qbgaflpgbyk2banl31wl";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2022-11-26";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "189ad3790d57c548896a78522fd8b0d0fc11be31";
      sha256 = "1k45pgz1jldkrczxyhhv6abj1klbkl07g2lxw7hhlsbyflg7h9sv";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2022-11-22";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "5e7efbc047be9eca1307899137a89cd2b6b8125a";
      sha256 = "0ibyffddw3j4r04xx4qpvhynxa695wphfs4p4vfxjzspwxw0rgdn";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-11-11";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "eca407c457ff2c4d04d809045e3f3e9620c1dc2c";
      sha256 = "1x6i21wbb5p6732wqz5a0blnx9ln7w316m7fk3fcq7xfb12nb5ck";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2022-09-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "e607a4787ae898fe844ea678e7f5977a9358d0b1";
      sha256 = "1lsr9c8rpcihkcbwj7l0qq7715588vnsn45r3spn5nan1w6ycwqk";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2022-11-21";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "1491b84348de39a54865f321b66bd2c03700ef04";
      sha256 = "1dv7bk3hzf4gs4ljbfflgy60q5lh2zvh120f9rmhsm4m0npj7z76";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-11-22";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "c5ddd07ff5f436cd8b655154d2a8e8d4c2f29466";
      sha256 = "1j72hsjsip1qa94zx8yx1jz62ikqa2dlqz27qv7mz6801ndh2sz0";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-11-10";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "fe57c180fd7fdea39bc0d85bac9252aa6a8645e8";
      sha256 = "1jac9pmg9sn28x62xx6n5brzycmgfsb825dfsh6mkny425705zsm";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimPlugins.nvim-treesitter.overrideAttrs (_: {
    version = "2022-11-26";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "5aacb06135a952190933f9bfff923957db8965db";
      sha256 = "1vxjpzg96n15d35lc0wvid3mwy94a48vpjn06b1n8sra384xa338";
      fetchSubmodules = false;
    };
  });
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-11-04";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750";
      sha256 = "1b7z8xyiplb9rjkdqwijnypjqrssrz5lr1wnl5vk1pyb6dnxspzg";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2022-11-17";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "1290fdf6f2f0189eb3b4ce8073d3fda6a3658376";
      sha256 = "1yznmc5a32b4bw0c9q0jfkbd77xmi7rmihfr0f44bcgqdxlp8151";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-11-23";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "cea9c75c19d172d2c6f089f21656019734a615cf";
      sha256 = "18ivpbfnxx5hilapcb7n1qq0a5am5sq6zixhb3slsfqqg0a2v8rn";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2022-09-06";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90";
      sha256 = "0nyvhlalrgg6n793lp3yrxgszv5j0ln9sjbh45pxxg0wn15jxm45";
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
    version = "2022-11-16";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "1b9df577262b2c4c4ea422161742927f80ffa131";
      sha256 = "14yiibv5qh89y8d7ps1rv65sxq2ckj7mky5wv9fkzhplvjzg84zi";
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
    version = "2022-11-26";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "abe6c99c7489de2c317869cf5dea57a9595a0cca";
      sha256 = "18b2vi0gl48257rwdnaq2xcrhhfmpahmjzcpm3c8k7z43igf8jla";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2022-11-01";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "7bc572fc357d7dec8d3ca620b53e763776472582";
      sha256 = "10rm01cxc1xnw7m886ssnmb5ihlsfjhp6sqm9dhmrkg4ywkbhj9m";
      fetchSubmodules = false;
    };
  };
  lsp_lines-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lsp_lines.nvim";
    version = "2022-11-16";
    src = pkgs.fetchFromSourcehut {
      owner = "~whynothugo";
      repo = "lsp_lines.nvim";
      rev = "ec98b45c8280e5ef8c84028d4f38aa447276c002";
      sha256 = "0xwbhznwbs6bshp1l501caymdcs486apn4rx4p9vnryrxdzc4chy";
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
    version = "2022-11-18";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "40c0ab2640a0e17c4fad7e17f260414d18852ce6";
      sha256 = "194r8p8nljvh5jb8i860qp8kr4i16s5q84nc6phqjygwacsq69s8";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2022-11-11";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3";
      sha256 = "0wby253z3njala4syizy3m463gi8l45gcf7rj866r2jhnfxg9ba8";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-11-22";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "ea8cae4a97b2127702d4b891c40c48d8230670e5";
      sha256 = "05qm8zgmh5q98hwmp0zc27wwmxnyady6v04kqd4b72cx00xnx0dw";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-11-18";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "5f01c1a89adafc52bf34e3bf690f80d9d726715d";
      sha256 = "0qgb1vx5ipzcgglphhk9wck55hdscx6bdh4lr2y7f7wfxg54r3d6";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-11-22";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "79f647218847b1cd204fede7dd89025e43fd00c3";
      sha256 = "1n99rq71fgasagglzq0sxlvxnprmbqi3jd47q5n59zs0h1q63hyk";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-11-16";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "ef8caa5002e53977779ce8ab18a9c393ed624386";
      sha256 = "1kb3gh0qlbc75qkwy3ybhgsm9gcwbdba75ffhpcbifd6s6rdfj0n";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "4c05626ccd70b1cab777c507b34f36ef27d41cbf";
      sha256 = "185mxjj3r9jhgylr3ai08i5br6xh7jifyqyxgsw9a0plq8qywcvl";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2022-11-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "59224771f91b86d1de12570b4070fe4ad7cd1eeb";
      sha256 = "1m8xs7fznf4kk6d96f2fxgwd7i5scd04pfy2s4qsb5gzh7q2ka9j";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "d2768cb1b83de649d57d967085fe73c5e01f8fd7";
      sha256 = "13imcdv0yws084z2x2lmdj17zy4ngf126i7djknnwp2jfkca1120";
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
    version = "2022-11-13";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "8bc9c4a34b223888b7ffbe45c4fe39a7bee5b74d";
      sha256 = "0rx8ncap1dfrgwkx1wsmhybr6cs1kdh0li5hssbhws2d6igij8zq";
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
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "a09d6ed9eacd0b81c0f8641757e60f7bb0e27f6e";
      sha256 = "1pqz1bz5nwdrm4x0p38xhabyb089spvp5khhl154k5mi6fsws219";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "5d75276fce887c0cf433bb1b9867717907211063";
      sha256 = "11ivy3iaw672yfgbq92q0xd9s6qijs5rd5464fgdwimqrsac0300";
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
    version = "2022-11-13";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "55e3330436784fb8ccc35a5cfeb13e48bab9dcd2";
      sha256 = "170ic9lp566x1l0brj2gj2zpbz5wl57df9wbi3zixm3agj56gnh6";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-11-26";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "04c61332a3cb78e56f7455d17d7878b0b7e66270";
      sha256 = "0db6s53540f1z11ffnmbfqbx504qpwzsrs8xxp9b61pgy66lsf3l";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "6b45fbffdabb2d8cd80d310006c92e59cec8fd74";
      sha256 = "1qdhyclzsw1inwwzw3kr1jxq3cz0qr358whj93y16x7id3ylsx52";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-11-15";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "a94390e0e8509944bfbd8265a5b4bb231d2d2954";
      sha256 = "00c0835l9vhbwndyfmk43jig08y425w3hl4lb2bssdqc0fca4ddc";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-09-02";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6";
      sha256 = "1r9y6zqar0gv8kvqqxlh07ifa16h5yqa24fj22qw63vgnysbxqbp";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2022-09-21";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "36fa3be9cba9195081e934b4f9729021726c5889";
      sha256 = "097ki3ms89a2m2kvv3fg43dq7cfj6j62n3g58fmr945j5a7srssj";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2022-11-03";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "3ba683827c623affb4d9aa518e97b34db2623093";
      sha256 = "043rchc7qbn65b7wfgvp6fdg67xijgd3i3jfm82i1rha7dlymb41";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2022-11-17";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "f8d30320ca277956852fda6db082e231153b8618";
      sha256 = "0y6vqv83f075a3728jrzrzx11wf8a1p3l6rn2irwgxd037b1ql7z";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-11-09";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "9ff7dfb051e5104088ff80556203634fc8f8546d";
      sha256 = "0cfssyyhcjndwr2xlk91rxzyir4ng5hk1f4fgij5hgrhhh3wgjdv";
      fetchSubmodules = false;
    };
  };
  nui-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2022-10-27";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "d12a6977846b2fa978bff89b439e509320854e10";
      sha256 = "1ghj8kjv2skh2hd9m6sghvj6pya8d9jvr5m9l9q1r0sg1i5x1kjy";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "e7cffd0e8c3beaa0df7d06567620afa964bc2963";
      sha256 = "0j2q6wd5izv6y5cj50xildd117zx8ncd93074fp97gdyb2xmp45g";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2022-11-24";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "fa21685e23cbb72bb573eecf48dd3644bc1513ba";
      sha256 = "1vbm54fykn6xzndrrrb1bcymbwbmanifnsr693v5647k5hmsjc64";
      fetchSubmodules = false;
    };
  };
}
