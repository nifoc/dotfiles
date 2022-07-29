# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-07-07";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "2aa872de40dbbebe8e2d3a0b8c5651b81fe8b235";
      sha256 = "0v15pbxhrz1ndb12pl6pwfynsfzlaqqam5kn9gpc7y9kfdb7yby3";
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
    version = "2022-07-10";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "986ad71ae930c7d96e812734540511b4ca838aa2";
      sha256 = "1gxz2ivf2p6p3h3d1xm0lb6s7jixf1l6l759a60n0vxv90a565kq";
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
    version = "2022-07-26";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "2a11836d290560c746b75c424827660e4d94bd12";
      sha256 = "1x9s116h1qk5xxhi43d06h43rz8fwm5v1jc2mfldidnljkp3la10";
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
    version = "2022-07-14";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "9dd019e84dc3b470dfdb5b05e3bb26158fef8a0c";
      sha256 = "0gmh1h28vvrzgmaiz3mv41d7dmvs83r4d2ha8409zvs5bv5d19ad";
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
    version = "2022-07-22";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "b5833a682c511885887373aad76272ad70f7b3c2";
      sha256 = "1czip023gay22dh4zz18pkxaazljm2miqhhifvwf39vrbx8sywdx";
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
    version = "2022-07-28";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "e449497c0bceb6e50947b840ec3658bf1108bf0b";
      sha256 = "0kq464j8m67bmm2050pgzb284n6jfs8ivg9j2xns0czjkw9bm4nk";
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
    version = "2022-07-29";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "60f2993b9661d9844cee3bebdbd1b5860577eb3c";
      sha256 = "0029s9i40x5ri104ray7hzw7c6xfryb18rq4rz8yq2wz65rr9npw";
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
    version = "2022-07-09";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "6bfa5dc069bd4aa8513a3640d0b73392094749be";
      sha256 = "0jwqmp8zx9iv80rlz24xvp62jnrhq7m8jamnk7s2x1cw2ik83gjl";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-07-27";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "754b18f33a3167f8ef0afe91a1960aa7db280535";
      sha256 = "0davfw57xv5z33685spsmh0mykr3cq0zpmk8by0a3p96pyrkfcv9";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-07-26";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "78ab4e9785b6da9b7a539df3bd6f70300dc9482b";
      sha256 = "1dgbhf8l3212rvhs424cdb2qh07k95biazyc0qy5xa7asrdwj1m7";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-07-27";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "53e812a6f51c9d567c98215733100f0169bcc20a";
      sha256 = "0qr84j39d4202ag1gvi26xilcsqwfw32d9lv96zc96a51l6r40y0";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-07-27";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "8c95fecb3960eb0d3d3b9bd582d49a613bd7a7fb";
      sha256 = "1y34pb7v7pk4zvjbab5bs5shcbxh0msiy6aijrkp119a1r0zpndj";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-07-25";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "706371f1300e7c0acb98b346f80dad2dd9b5f679";
      sha256 = "1cwzzdwhsy3fqxwdx0big2qfvqha4m97nml83i1mp31agjk016pk";
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
    version = "2022-06-15";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "62fc67a2b0205136bc3e312664624ba2ab4a9323";
      sha256 = "0wcys2z1yw6raxr9x5nm19ac04q8gfri4pw9mfsh18smv4rnl8zs";
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
    version = "2022-07-23";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "892be036fa82871f602f20a5245dfd4bc88d2f08";
      sha256 = "17mgv9qr9bn4ajy825yk5zr3cqhdqz113261vckx43sfia4ligbg";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-07-06";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "972a7977e759733dd6721af7bcda7a67e40c010e";
      sha256 = "07qzjlbzaa0w1iyd8mmx166ldfrmmicm4mw0ajpdwfvfmlvgnv3b";
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
    version = "2022-07-16";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "3cebd218a7b85a75df3f4f7867adc79b8624a217";
      sha256 = "0n7hhiws3i0dckk8jmb9bb6qqm43h1l39v6f1m3z918lgjmlx5rw";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-07-11";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "40f20e6788e6ce850802cbd2ca029fbb66b5d043";
      sha256 = "0a7p0lvkb8x5cngr7h5vbljckx44lvmbmflwi045p1fcb2b9r250";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-07-22";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "306a92830ede75d7d3a48ba04c7e603b73c3f377";
      sha256 = "0ql6fjavhnkwmnay60r0k19c91qcrn8ypgvlv58nc2cbk54fh0m5";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-07-06";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "805a158b2b44b015f7966b03cd9def489984be8f";
      sha256 = "1nv3qas9f4h58yy6lc72r5nqqpzvynraf51k3wjkhfpkkfn7dvpv";
      fetchSubmodules = false;
    };
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "2022-07-24";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "c4dd9b4de03b891f648b098c25e4dc1bc48a13e5";
      sha256 = "0i9xpsg49m4m16m22iixhsfajnbcyw383iql1r9s5r8cwmzax0kq";
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
    version = "2022-07-28";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "a7c9a6fd135f96639e2ac686691a32db6d011471";
      sha256 = "03avxz9l9kz3c99dqjk63zw5wi1s0vakas9wx8l74sqrr9b8pba0";
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
    version = "2022-07-21";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "06e986fab0d0c31ba981b9f21c712dc72b3d237f";
      sha256 = "0pc90hvjkxjg9q4qcn3h2j2z4s40h3ly9pi4jfp61cnqcqm67nsw";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-07-25";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "8b817e76b6399634f3f49e682d6e409844241858";
      sha256 = "1dpxnk6b7rlj13y15sfsc05k3mzcp1b3dmvpj03af0imp9lq70c3";
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
    version = "2022-07-21";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "cd2a59f16d3dc8c54dabc58c31c9c539fcef3c2b";
      sha256 = "14mfvlp44qn3jb4fnicay3cxy0vya5jix41hnvfz1j3bi2c0zng1";
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
