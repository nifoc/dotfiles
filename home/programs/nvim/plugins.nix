# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs) fetchFromGitea;
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
    doCheck = false;
    doInstallCheck = false;
  };
  plenary-nvim = buildVimPlugin {
    pname = "plenary.nvim";
    version = "2024-09-17";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "2d9b06177a975543726ce5c73fca176cedbffe9d";
      sha256 = "1blmh0qr010jhydw61kiynll2m7q4xyrvrva8b5ipf1g81x8ysbf";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-12-26";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "63f552a7f59badc6e6b6d22e603150f0d5abebb7";
      sha256 = "04yr85zz9b04lgxl9gfda52l0p82a1lc891s921mll3bx48i1xb2";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-09-26";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "032c33b621b96cc7228955b4352b48141c482098";
      sha256 = "16a3x84yh6p9i4h3fic59q29cbb6cwmqfx3051g9lxhh3r9dk0xb";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2024-11-13";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "f9b905994cccf3c55f41af3a0a1f4c76c844e411";
      sha256 = "1dvsl6wd6m4gygn32rcmz95hzklknwp4s3s9iyp0ac48q8z8kp73";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2024-12-19";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "515acae4fd294fcefa5b15237a333c2606e958d1";
      sha256 = "1sr09v6q07q111pbcm8nc12mvgzb5f5n7bg8frrwb6dpspj4h97n";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-12-26";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "17678b00fa5c2712890a0ec2e269d0a4de1207df";
      sha256 = "0d6fw1205bhlaxi0kzbl9gn4vgnyca2qxbnch21hz2mbm2wlq8qm";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-12-15";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "77e5bad54227dcfe3878ffbda88ab1efdaacb475";
      sha256 = "1wpk8aa8nnh4ba9n8l1l1k4gi5b1zy9p3fg2q72b15czwizq8g58";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-09-16";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "ae0a2afb47cf7395dc400e5dc4e05274bf4fb9e0";
      sha256 = "0v6vn3f9svj756ds8cp0skpw65xixlx1f3aj0fh374wdpb5i4zhh";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  fzf-lua = buildVimPlugin {
    pname = "fzf-lua";
    version = "2024-12-26";
    src = fetchFromGitHub {
      owner = "ibhagwan";
      repo = "fzf-lua";
      rev = "76e25abc4bbaab243b52fad7f7d4262e76254fd3";
      sha256 = "0prii8hv8jli4p69mjqjma650q906f187i6zvk2g9i4kdvzzqpj6";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-12-25";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "ff2b85abaa810f6611233dbe6d31c07510ebf43d";
      sha256 = "035sly6x5a8f9h3gw1cnacm4d0wdn5iabn3ck7hzas0y6av28vym";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-11-26";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "ece818f909c6414cbad4e1fb240d87e003e10fda";
      sha256 = "0w8v835diycphiq5rd9pw43sjsyqj0fbfw9njw11i0967ls0ap0b";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-12-23";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "545d8814f624fb5239c4691fa0914549540e6f53";
      sha256 = "0b25wc37c3biji0mvwwh1s0mlk1i09ajjfhr2f9sjs0l04v6mcyc";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2024-12-05";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "d79a1c3299ad0ef94e255d045bed9fa26025dab6";
      sha256 = "1wdavqmwadby9lyw415jw79kxynxv4fxg2v376y0rkxf258clarq";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-12-19";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "1fea92f1d9908eaa5eb8bafe08b4293d7aadaa55";
      sha256 = "11khnhy2srlq02x3xb7c33k8rbinj8s6c9k2r8m8f70xfn45qgdl";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-12-14";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "872dcfa0418f4a33b7437fb4d9f4e89f2f000d74";
      sha256 = "1jnxhj25x9mzm2m8sqgp8viwd8kswyrc1k4s4yqxh457m8xj6yn1";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-12-02";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "33b06d72d220aa56a7ce80a0dd6f06c70cd82b9d";
      sha256 = "1zicjd8y9a16rq1rs1xbmc6g927j5xi05yrxj9ap6wp72pfxxw3r";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-12-20";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "b555203ce4bd7ff6192e759af3362f9d217e8c89";
      sha256 = "1s3wiwhnqp046skxp60sdrvzhrij4javhm9ndvfsw2fv9bc35x37";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  cmp-nvim-lsp = buildVimPlugin {
    pname = "cmp-nvim-lsp";
    version = "2024-12-10";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "99290b3ec1322070bcfb9e846450a46f6efa50f0";
      sha256 = "08q5mf5jrqjjcl1s4h9zj2vd1kcizz0a5a6p65wv1rc5s1fa3a49";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  cmp_luasnip = buildVimPlugin {
    pname = "cmp_luasnip";
    version = "2024-11-04";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90";
      sha256 = "037sh4g1747wf07f9sqngiifp89hqww6m2rvizy5ra7jyd04magk";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  cmp-async-path = buildVimPlugin {
    pname = "cmp-async-path";
    version = "2024-10-21";
    src = fetchFromGitea {
      owner = "FelipeLema";
      repo = "cmp-async-path.git";
      rev = "d6d1ffa2075039632a2d71e8fa139818e15ac757";
      sha256 = "1x10v0kd0i2pdxknzdn3zgqdn4hgbivgnczsj56wc32jzcs6k49i";
      fetchSubmodules = false;
      domain = "codeberg.org";
    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2024-12-25";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "9180320205d250429f0f80e073326c674e2a7149";
      sha256 = "128dby40rlzm6sy9ga0xbb9534rla1nc8k4apjsb8kyir40bgbi7";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-11-17";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "b464658e9b880f463b9f7e6ccddd93fb0013f559";
      sha256 = "0p4v49saqfsc8kinl3wc3zhmr6m2q86vmay2f10payp29n4v3did";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-11-22";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "ad8f0a472148c3e0ae9851e26a722ee4e29b1595";
      sha256 = "08vlvi9iwhl5qy924s6dmxaczg1yg096vdchp7za5p7wnb7w3zkg";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-11-28";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "9f0cb495f25bff32c936062d85046fbda0c43517";
      sha256 = "1c78320liqhza52gq2xylykd9m6rl50cn44flldg43a4l7rrabxh";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-12-21";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "ba858b662599eab8ef1cba9ab745afded99cb180";
      sha256 = "1pk6863f79278mrw1zdshbalsih245ynkp4z54znza238a57x87n";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-11-14";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "cc359b628266cb9a84b2d71c883f2b99e16473a0";
      sha256 = "0gymrk7jjf6pi3nalyckcdyq28z8fkhi4a6wmqm3wqm2by1q5r4v";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-12-04";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "259357fa4097e232730341fa60988087d189193a";
      sha256 = "1q9fgqvr84lynhy2vcyzp9xhzrl80g2pin14v7d3v0pgj10m8y8z";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  virt-column-nvim = buildVimPlugin {
    pname = "virt-column.nvim";
    version = "2024-11-12";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "b87e3e0864211a32724a2ebf3be37e24e9e2fa99";
      sha256 = "0mlygwrsf6pc44jscq1nb17a8f7p1jv2hgg7ibrm08hqgv7y6fm3";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  hover-nvim = buildVimPlugin {
    pname = "hover.nvim";
    version = "2024-12-11";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "hover.nvim";
      rev = "140c4d0ae9397b76baa46b87c574f5377de09309";
      sha256 = "0z1ff8awna7pk13k56xc4vsdwcn3rbsr5j80p8aq1nkm521j5q5p";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2024-11-23";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "5f808b5e4fef30bd8aca1b803b4e555da07fc412";
      sha256 = "1dxsyv26mm7lzll3xlkzjj6w7kp11wfak8rgp19fg2d8301kxc0z";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
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
    doCheck = false;
    doInstallCheck = false;
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-12-24";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "9ea60f79e370d8f4847efc145e53afe4b0613fc1";
      sha256 = "11rk1mjb8sx5b43qrbpy3qmmxsdk1rs2agxzrpidvnxvrqwjzmh4";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-12-16";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "9238947645ce17d96f30842e61ba81147185b657";
      sha256 = "1117w5i7996vxx32vibb09zpzzgwaipj5ldkdgck3ds5vkcdlk53";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
  which-key-nvim = buildVimPlugin {
    pname = "which-key.nvim";
    version = "2024-12-15";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "8ab96b38a2530eacba5be717f52e04601eb59326";
      sha256 = "12wkl04apgag0p5njw8mczzlbxqf5h08k61qciwy10n4q1harzvz";
      fetchSubmodules = false;

    };
    doCheck = false;
    doInstallCheck = false;
  };
}
