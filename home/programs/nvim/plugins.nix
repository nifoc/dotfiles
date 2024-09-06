# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
{
  popup-nvim = buildVimPlugin {
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
  plenary-nvim = buildVimPlugin {
    pname = "plenary.nvim";
    version = "2024-08-19";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "ec289423a1693aeae6cd0d503bac2856af74edaa";
      sha256 = "1ka431c9qjlz2lcnjg9cay3vsfjrq2iyl5i0ws4aplkw6vivwsg8";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-09-06";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "9793801f974bba70e4ac5d7eae6c4f5659993d8e";
      sha256 = "0gssmr3j5cv4313pc1vh0jfd2zi8y71dnr0xyxxndxljzxggcznr";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-06-01";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "f73bba23ab4becd146fa2d0a3a16a84b987eeaca";
      sha256 = "0dl6nmmkkdrwl982m1ji7cw2mkln2c4iiwrg06gs0v3sx9qkkqqm";
      fetchSubmodules = false;
    };
  };
  vim-cool = buildVimPlugin {
    pname = "vim-cool";
    version = "2023-09-06";
    src = fetchFromGitHub {
      owner = "romainl";
      repo = "vim-cool";
      rev = "662e7b11064cbeedad17c45d2fe926e78d3cd0b6";
      sha256 = "1ilddllx5riyzw4dx05rnvcxgngg7y2iydnkjn01wlddmid65p9k";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2024-06-10";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "73215b77d22ebb179cef98e7e1235825431d10e4";
      sha256 = "03qdr72nssiwm12fmvmi3x579d4rxkfhscphsr107l3widc5a7j0";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = buildVimPlugin {
    pname = "cutlass.nvim";
    version = "2023-12-18";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "1ac7e4b53d79410be52a9e464d44c60556282b3e";
      sha256 = "0p00xjn6da7hj10vwnighsf1y0zmndfx9d2nb95whnq6awkbyr6f";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = buildVimPlugin {
    pname = "substitute.nvim";
    version = "2024-07-06";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "97f49d16f8eea7967d41db4f657dd63af53eeba1";
      sha256 = "017g2y3hmwa5ar778djr86x9v2nc9lg84njx82rajs6lx28a8m94";
      fetchSubmodules = false;
    };
  };
  move-nvim = buildVimPlugin {
    pname = "move.nvim";
    version = "2023-10-25";
    src = fetchFromGitHub {
      owner = "hinell";
      repo = "move.nvim";
      rev = "30047fbb4ee0f3b79bf969d37d889085e96b44e6";
      sha256 = "1z0k361n41md768jxk9sngx06lv93hcnss64k7h5clg5khxf6pzg";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2024-07-12";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "fdf503e52ec1c8aae07353604d891fe5a3ed5201";
      sha256 = "1f032gwhr92w57mb5bfsgr14ayi7qg93rvjq04cy5kwdniqg92ij";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-09-05";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "bfe74a4899882a4ef45abb80813f14644a110a34";
      sha256 = "16226i6ls2cg9i0km40v5p3hczn0c5axfpf2srqp62nms1v0xrh2";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-09-03";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "5f73b24aeb94f5274c218955573153c69ce4d1ee";
      sha256 = "0qwlq6h2skpppn2aai7d9qhfk6cwfl8zz3lj7llyid0y8qqig41z";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-08-31";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "319c01b99b7a8c9ac2066bf0efd4d6ec68fef444";
      sha256 = "0nav42w1g9k27jrxzwspdxdalq9sikz7g1f4p57v0wjnrzwdv741";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2024-08-15";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "5972437de807c3bc101565175da66a1aa4f8707a";
      sha256 = "199hg402lld72wyiz501ynq34ncsrbx8pd6xjqhalv3gwjfdzp5c";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = buildVimPlugin {
    pname = "telescope-ui-select.nvim";
    version = "2023-12-04";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2";
      sha256 = "1cgi4kmq99ssx97nnriff5674cjfvc3qsw62nx3iz0xqc6d4s631";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = buildVimPlugin {
    pname = "telescope-undo.nvim";
    version = "2024-06-30";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "51be9ae7c42fc27c0b05505e3a0162e0f05fbb6a";
      sha256 = "1xz2fccjp1rv7l0xzkczz4z2w32q8slc9lc6rm5219s1hl7k4nam";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-09-05";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "bdbc65aadc708ce528efb22bca5f82a7cca6b54d";
      sha256 = "17h25p1faqy2gckz77nbnl9sh8vxh5ziz78bfvxjnvp88vl7rsf5";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-08-05";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "99e4b2081de1d9162666cc7b563cbeb01c26b66b";
      sha256 = "0gz37cf5rnmwkh9826dwr2jzqgz4fin2j1xd9r8n6xs7a3g2rzvk";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-09-06";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "28a6a50e5b7b963dc6a5d2defc40e158231a67ed";
      sha256 = "0wgy6hb7ic4894dbfffrmkamw81d5sskbg01bkvkrf98lk9lqb46";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2024-07-25";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "cff4ae321a91ee3473a92ea1a8c637e3a9510aec";
      sha256 = "0l66zyawfjy0r7rhi80skk6x156ybr72jlh4qxk0xd0l2hkbm8nl";
      fetchSubmodules = false;
    };
  };
  nvim-navic = buildVimPlugin {
    pname = "nvim-navic";
    version = "2023-11-30";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "8649f694d3e76ee10c19255dece6411c29206a54";
      sha256 = "0964wgwh6i4nm637vx36bshkpd5i63ipwzqmrdbkz5h9bzyng7nj";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = buildVimPlugin {
    pname = "vim-illuminate";
    version = "2024-05-17";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa";
      sha256 = "0g86iv1mndcalrizdhl3z8ryj19jnqv139jwijpzyfk8gi677lhd";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-09-03";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "a7ce9c78a7c710c28bee56dfab10a5c0c80b7fb5";
      sha256 = "1bbns4kdjaiisp1wiqdr91kg1jsngf485hm4r35pj8svza38awz9";
      fetchSubmodules = false;
    };
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-07-24";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "98d7d4dec0af1312d38e288f800bbf6ff562b6ab";
      sha256 = "12g6rwrj67wk4fxxl31rsras5jw6a73xngrazlw095xhz6sd9l71";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-08-28";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "45db5addf8d0a201e1cf247cae4cdce605ad3768";
      sha256 = "120iq5y7prppphsq1ilc7gd214rqh5v5h8wmskvq2lmhmx7n3gym";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-08-01";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30";
      sha256 = "0fk7s6apvq4r9h82jqm5azf1zg9aklyycgh7ivnb98bw9a0ivjim";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPlugin {
    pname = "cmp-nvim-lsp";
    version = "2024-05-17";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "39e2eda76828d88b773cc27a3f61d2ad782c922d";
      sha256 = "13zcw6c7zppvbsjlr8yj3vml6ayalvhjbbqszljmn1f9hmkpwg89";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = buildVimPlugin {
    pname = "cmp_luasnip";
    version = "2023-10-09";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "05a9ab28b53f71d1aece421ef32fee2cb857a843";
      sha256 = "0gw3jz65dnxkc618j26zj37gs1yycf7wql9yqc9glazjdjbljhlx";
      fetchSubmodules = false;
    };
  };
  cmp-async-path = buildVimPlugin {
    pname = "cmp-async-path";
    version = "2024-02-02";
    src = fetchFromGitHub {
      owner = "FelipeLema";
      repo = "cmp-async-path";
      rev = "9d581eec5acf812316913565c135b0d1ee2c9a71";
      sha256 = "0dv00zsgyjqk98cnxkmc4hjqgsm5mhjg4q2j7xkwz17kq59fiv26";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = buildVimPlugin {
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
  cmp-cmdline = buildVimPlugin {
    pname = "cmp-cmdline";
    version = "2024-03-22";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "d250c63aa13ead745e3a40f61fdd3470efde3923";
      sha256 = "1sh4ar3ky4qikh2brlwy9nmhy3208fs77ysbgvhccj0lx2krf6c8";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = buildVimPlugin {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f94f7ba948e32cd302caba1c2ca3f7c697fb4fcf";
      sha256 = "0iyy37l0pc09hs610c40q5qzvg344200kvdkn0z8pjc4zk9wc6q4";
      fetchSubmodules = false;
    };
  };
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2024-08-30";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "0ebe875d9c306f5fc829db38492ffff2a70d8e9d";
      sha256 = "137zyhhmj7fhxsdnbkvbbqjakbmcz86lap1xn3mlhbkqr7zmy36q";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-09-02";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "fd2badc24e675f947162a16c124d395bde80dbd6";
      sha256 = "06jzi0rdrvw24bm6zwxzqd2clml8k8zmdnqkbqx5vj30rzjchc48";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-09-04";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "fe3deb7f67ce0cc4ebfe2ea6c1c7ae1c7a939d73";
      sha256 = "1p1y1fswkgwrc719lzn5if97zp4qnghjbyiirkc3j48h1ngv1ilk";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-06-24";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "ec2dc7671067e0086cdf29c2f5df2dd909d5f71f";
      sha256 = "1d5ffrsl1ryiq8nzxx7k69gpin6zs2ys4zc5pg47qcpazx7my8qc";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-08-31";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "1fe476daf0b3c108cb8ee1fc1226cc282fa2c9c1";
      sha256 = "1h7li25qn51s2as7j9xan707shr6xyb02asl04k46skai3w0055w";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-05-21";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "0d797435e54645a5f98bad7ad6046aac1ef95c1e";
      sha256 = "0payyx0j0s4wgk5xvczdnjqkj5nymlhw4f7hcw3sl9m334vnxshb";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-09-03";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "18603eb949eba08300799f64027af11ef922283f";
      sha256 = "0jai4zh4xf9h981419k5k7dvvwkcippcyc6arfv06pqjy2b6xr77";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPlugin {
    pname = "virt-column.nvim";
    version = "2023-11-13";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "b62b4ef0774d19452d4ed18e473e824c7a756f2f";
      sha256 = "02lp989lykxw3qzv66ch47lz7n99xf3b3bghqhsnadrhnlky6n7f";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPlugin {
    pname = "urlview.nvim";
    version = "2024-06-04";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "c07733179e27c225ac3c58c3951701ee10b2dbde";
      sha256 = "1qbqn9h7602dw8vgj5m1i45g679n8j82h38hl0ab9lhxxykf2cys";
      fetchSubmodules = false;
    };
  };
  hover-nvim = buildVimPlugin {
    pname = "hover.nvim";
    version = "2024-06-12";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "hover.nvim";
      rev = "4339cbbcb572b1934c53dcb66ad4bf6a0abb7918";
      sha256 = "1nnhm8xhkdjvqal7016v22cljhpga8y0mydmvalz954cviskhna3";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2024-09-04";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "1ef74b546732f185d0f806860fa5404df7614f28";
      sha256 = "1i1frmz9i65ivkkvb5rawwlr74xhxby2pp1chs443lymw9kbqz5k";
      fetchSubmodules = false;
    };
  };
  diffview-nvim = buildVimPlugin {
    pname = "diffview.nvim";
    version = "2024-06-13";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "4516612fe98ff56ae0415a259ff6361a89419b0a";
      sha256 = "0brabpd02596hg98bml118bx6z2sly98kf1cr2p0xzybiinb4zs9";
      fetchSubmodules = false;
    };
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-09-02";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "9bc4ee89bb42be31a2f0b1da41e36e3e6cab9bbb";
      sha256 = "09vh78nwzj256z1i3fsjym7vh58by72zvc5xlr2qi13j0ms63vxj";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-07-13";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "d855eed8a06531a7e8fd0684889b2943f373c469";
      sha256 = "0lb8zbncdlq91f4x8jqijpqvaigjw7f8b79milxwa11wvm25sg3y";
      fetchSubmodules = false;
    };
  };
  which-key-nvim = buildVimPlugin {
    pname = "which-key.nvim";
    version = "2024-08-31";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "bfec3d6bc0a9b0b2cb11644642f78c2c3915eef0";
      sha256 = "1s856ns57ds6ckh2ay4f0g0kd32bqq3qfl0ym01f74bn84rhm38m";
      fetchSubmodules = false;
    };
  };
}
