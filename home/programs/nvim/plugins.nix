# This file has been auto-generated
{ pkgs, ... }:
rec {
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
    version = "2022-11-06";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "520776f30a3b39ed56402bffbdae57549e778b40";
      sha256 = "177gsxp2s2qkn6xr5rz9y45mns31v35g6dc93azj0h3dpa2ds2km";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2022-10-25";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "75b9b86807448db9ade7715a86171d31da6348ff";
      sha256 = "0vsnsp2ab0ma0pb53lr6pyp8330f0axcnbkzr9cfckv45fqvd5b2";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "b43ed12a3d4f2814a6648137def522125d8e374d";
      sha256 = "02kp7xdvyk2h0dvypcpqfjn5i1qnrm8379mf872sav09bsr9wzlf";
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
    version = "2022-11-02";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "bc818091dfffa5bc72504a39f0996a3976bfc87b";
      sha256 = "1indz5f705f0f96r4l438x2zpwfj4mzxzckz4jfgzkp6cdgs76dl";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-11-05";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "dda4ed60f90ae889f459887449a43c4de29609bd";
      sha256 = "1vg3aawik80g59kvaf0n97hc6k3f7bkh43xw94dz3f3gs1yiks8b";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-11-02";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "7ff76dd8248efeabb322fec87b22d33c129536fe";
      sha256 = "1g94pxa1frc5ym506vdvfpsk7qby2wzhdv3fby5c09a1vnkz7npz";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "d37fc85a4060352bcd4d8cbed0907cba442deb90";
      sha256 = "0hf5raqbj4ygvvqhvshrdyvfrch4wjz8ca62vzq584pb6jqpdwzc";
      fetchSubmodules = false;
    };
    passthru.withPlugins =
      grammarFn: nvim-treesitter.overrideAttrs (_: {
        postPatch =
          let
            grammars = pkgs.tree-sitter.withPlugins grammarFn;
          in
          ''
            rm -r parser
            ln -s ${grammars} parser
          '';
      });
  };
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
    version = "2022-09-19";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf";
      sha256 = "01smml755a1v09pfzg3zznr4hbxil0j8vqp8wxxb89ak1dipmjy2";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-11-06";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "cc77713294892c5bbce26adee665114250624e6b";
      sha256 = "15570726pdndzagpp2g4w83wrgj0sifbbmirpc9d3fwdnys5gxqz";
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
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "f244aa391774b29878db580eff63a9e26dc5f084";
      sha256 = "1awd6008lzmhwc285ldzglmjmzqiianfn32d5siy9lhlri915v33";
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
    version = "2022-11-07";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "f40eae01b8e353e9d6e61792567c7d3b9856fd20";
      sha256 = "0qb42zdss3429nvsid7faysbhvzs6xp3cg4v1jmh228yr2hqgghs";
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
    version = "2022-11-02";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "2fad33454cd6e37527a2d41f310d77b552d8c1e0";
      sha256 = "1zdcnazqawkyab9gyfqi1mvnzzil9xvzj7mz7hjqd1w6g9r2c1ip";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2022-11-02";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "fb83d835eac50baeef49aac20c524a80727db0ac";
      sha256 = "0xk5hhsb3gv3yrfcr3gnxj9g9bcdab8nlfi06q5c7nqgy4fryp6n";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-11-04";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "9812a18621e00286cb82008b9407e561ed801b03";
      sha256 = "07dlk8s1lfa297ry2ybnipnibn3gr7akmkiryg6s1ysjpaddkdn3";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6";
      sha256 = "1gy2caam9g1zhnplj6d943p62n4kqgasi4wwgq1ry7gzlm2gi5v0";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-11-01";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "619796e2477f7233e5fdff456240676a08482684";
      sha256 = "0s4r8y0wadwj1via61kqx711skcj7cyd56qgy0p1bdkz09ash5mh";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-10-28";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "c93311fbcc840210a2c0db574177d84a35a2c9c1";
      sha256 = "1kisjlwa2nad9xcwzal1yfdnwpcklkpz2ks6gpqqjfarnxw25c16";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-10-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "9bb8ee6e2d6ab3c8cc53323b79f05886bc722faa";
      sha256 = "1z7b53yxamph255rvrs5a4pq5hbqa0nbwpdh1xy8fvfc71gap80n";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2022-10-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "78924d1d677b29b3d1fe429864185341724ee5a2";
      sha256 = "1gzn4v70wa61yyw9vfxb8m8kkabz0p35nja1l26cfhl71pnkqrka";
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
    version = "2022-09-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e";
      sha256 = "00ivhdq1skdccmkn0sd0kr8b9gnap84in34q5r2mkmnd07vhiwr2";
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
    version = "2022-11-05";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "bb32035068b66004f79933ff09edeac273d38c1a";
      sha256 = "1c98y3z9ik1vzydkx2cyn7rvm4smp2i8qjxjpksxcxpf9zk7xrc7";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-10-27";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4";
      sha256 = "1laskay0f6rf9283cgiv1db3ph4imzyfk10j0wn6f8zsm8n13m1v";
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
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "bc091fd9c3aa1cacf7b3374f5b1592be3beabd13";
      sha256 = "1q8pda363nvvfciaw24cjdfh1miy3cx95b7khlak5rsij8v4n21g";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-10-17";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "13739a5705d9592cbe7da372576363dc8ea5f723";
      sha256 = "11aaddmns22l3wv5gynwv4q82fln0qx62h6avaxvpz6jlyw3x1g2";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-10-28";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "7e5096b736ae252d04d543af6a13280125dc6d0f";
      sha256 = "1hqa8c0bfj7yl3zdpid4aj26jay65f40ixaydh7ic79rxm9a1k0i";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-11-04";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "7bd719094a6b712e02b99e40aacd07c8eae871e2";
      sha256 = "0fas2hdcf7ddvcwsh8q7pc9a5cj0xsb0677jzpq9z9ph71b0d66f";
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
    version = "2022-10-27";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "f7dc336aff93ce421f3092aaec1fb008a86433ce";
      sha256 = "0iq69smk3nn4mf9q0rv98kka6a4awrbpxabrss7nxjaghb2bs7v0";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "9d73a30e9cc524ab3d1c7095c74de9fb87684461";
      sha256 = "1nbr1cr8zc05gqjhxjf8pvscbmy41kcqlkkqcrhmw6m94nzckz8j";
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
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "ba270debc292cf173f5907ab67325947334c6dd8";
      sha256 = "1zwmzvy900xdqzp7p8dicp7gr6x7256j30y9aqq1s06lskkg9w31";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2022-11-08";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "edc8df60a16bb0f2709110b29fef98c6cc616d42";
      sha256 = "0gydjg5aa0wcjpayls4gvknrrjzc787id31p3v0ch5glqxvkc7hl";
      fetchSubmodules = false;
    };
  };
}
