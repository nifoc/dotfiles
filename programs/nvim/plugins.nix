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
    version = "2022-07-04";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "46e8bb9d3a852e0a2678be2d48179db545a9a39a";
      sha256 = "0jdaayzyk4w39k72yh5asg3rc5ljc1j4w5g22g0bjg3difznkqgy";
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
    version = "2022-07-05";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "88b33221bdb7a4452d2754db565c104f22859db9";
      sha256 = "0afnhq5dwcizmak41f7j9i9ddsnwa1jrzpxpvv5w76as30xbd0pq";
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
    version = "2022-07-07";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "74c4e2db149c51afe613f44a7f3f5585ae3cb4f5";
      sha256 = "1h9nkp2b7rdpdpwm90k898jl6fsks3yj5x54n1z1bh86198kz9p4";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-07-05";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "a6072a8e1ed3d655e214721fc804c1eae508665e";
      sha256 = "0rvlaags39xlqfmpwyl36xf456g8hyhgyaav3l8jcgasdx8asrkq";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-06-29";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "30c6f3f200818883a7f790f81148fc0c22731910";
      sha256 = "0jgxjmm3024jpjq6nnyxaa519c064lczigdnd0s6j7i10mm5cd9l";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-06-21";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "837167f63445821c55e6eed9dbdac1b0b29afa92";
      sha256 = "104rvha3bqsn5rnrii0z023x7a4ph3rljlmqjgaki27crfnxx8sj";
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
    version = "2022-07-07";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "a36500c7ee6e9dce08fde9d1c12a334cfca7553f";
      sha256 = "14jzanavsh157kvgmzf6w4dm9q3n9i5axmjpjl5hpxmjrwajm9vb";
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
    version = "2022-07-07";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "d17179dbddcdf05f69b67ac13e2127c58a6295a7";
      sha256 = "0r5jqdk1d4azslrpzg275marzxhygl3py95yl3xrizczaikdwz1q";
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
    version = "2022-06-23";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "5249977a585c3c17d94afdc8f0255a689d3a0057";
      sha256 = "0d5gh1n2r0knhmlqpgqx2f67fg5828p6pwhpf7zi89jap53skrwn";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-06-29";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "4086630ce2aaf76b2652516ee3169f0b558f6be1";
      sha256 = "0pzjvwfbd9zlzvwf5k4nrfl64vlrwhahks0nkqjmwqijqyrrbl1q";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-07-02";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "295cc9e422060b3200234b42cbee6dde1dfee765";
      sha256 = "1cpqq5miskc87az6ckcgbcpi8acb6hvj57mp7kfddq6s4414svz5";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-07-06";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "24afb4c178d8ea28bfa73f37814ada43be478b1d";
      sha256 = "09fx4nrj9z0w8idv9pm80dlm57ffy5cxj9yy2agxwiwr0c1lkxsr";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-06-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "9897465a7663997b7b42372164ffc3635321a2fe";
      sha256 = "1ic1h8h1h4v5f9f76vahl7yz7smq55x59r7j5h9gdmj97n0p0fp4";
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
    version = "2022-06-20";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "007dd2740d9b70f2688db01a39d6d25b7169cd57";
      sha256 = "194i2b6qbl3z4j2p2s6sig2fac8i9kglkdwdc5h3x2q7avw70yrg";
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
    version = "2022-06-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "981baf9525257ac3269e1b6701e376d6fbff6921";
      sha256 = "14i80iajwnjnnb6c5cmrhcvjdy1p8zvy0hn4gr7qm5pivfh88n74";
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
    version = "2022-07-06";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "d93f3d8d7efc3f3dd7c5a8079a1186a89905aa2f";
      sha256 = "1q23i0i1q280iafqdizp4chi43rsb01gmgydrnjsvrz0pvb0i5li";
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
    version = "2022-06-28";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "c8a393ecb6251d15e76dce8d8da522062090497d";
      sha256 = "101ph3wm3cgg5j4ai85p64rkaipq0zs785bpf2gfhjjb5qg9isa0";
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
    version = "2022-07-05";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "b5a2b1f66b61df620f92cd3ad13f6d8aa7cda08c";
      sha256 = "07szcbpn0jq58abhbc2725zd75r7msp5dr5dx09ynhv4kwslwdrl";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-06-29";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025";
      sha256 = "1wppsqpi5h0qb1vhxryjw0sn0g8yhkpald47cwnr5r3ix5w99wfa";
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
    version = "2022-07-05";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "8cba5c20c9d8517af21ac9e2afd06ad7b2dbdece";
      sha256 = "1radhrw4byzif24nrfsbmjyqbxahh6m9w3lhwh3hnzck08kwxvbm";
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
    version = "2022-07-04";
    src = pkgs.fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "16c3985581ee65bccdfbebbe014b24a01adc7d1f";
      sha256 = "0spkh7sq1gwxpkvxb7ghrvjmw4433k7wswxd1j9vxdnmzmzw89wb";
      fetchSubmodules = false;
    };
  };
  neogit = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neogit";
    version = "2022-07-02";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "585251902917f33b3574f2bc7670f68543bd3481";
      sha256 = "14fpqhh98kq4fh2sf4rvns8ffrk9zx44k8p5d6z9l39jygwl8xy1";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-06-23";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff";
      sha256 = "1ljqm90vmam9zisq4z8js4z1nqg3ybmib1y3x0s6g6b2kyyfy1dv";
      fetchSubmodules = false;
    };
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "2022-07-03";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "9a79ce2e670a3bbf85a6669ab5a6e5f6f01f2a13";
      sha256 = "0m49sqxalr69h5f7b7bplgdnxazmsn82gw4h9gxvjfi9v4xgblil";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-07-02";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "74ba257b6cf7fe2b7bb0f6813088ed488baa4a2a";
      sha256 = "0k27isyrsdqf9is943m51wvvkkh7kw5qxm4c5rbbxd2gzb3ykyn4";
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
