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
    version = "2024-09-17";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "2d9b06177a975543726ce5c73fca176cedbffe9d";
      sha256 = "1blmh0qr010jhydw61kiynll2m7q4xyrvrva8b5ipf1g81x8ysbf";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-10-11";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "19d257cf889f79f4022163c3fbb5e08639077bd8";
      sha256 = "0rwlikjvc469fkmpn980abvk27dyf23azamac7iz2wchkwx88ia9";
      fetchSubmodules = false;
    };
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
    version = "2024-10-16";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "94fa7885a06a67f0a8bfa03e064619d05d1ba496";
      sha256 = "1yxkhi11a81nmll9il3jq2ii8nbh7x2mf2k5w8ql5y27bdl4wcfy";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-11-09";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "0603b3e3d21ebe2fa82dc5361a3d500e0d3ad3a8";
      sha256 = "1vczd1crllc9s86lzwail848wcfgi7rq9gq1lmfkllplkd0d4wk8";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-11-08";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "f22496dfdd46da4d571f5254c72eff65ff5a1c27";
      sha256 = "1kl0pqp1hcdyj83hk53qlbr9lzz46wqxa73nnpzi6gp7085a1ckg";
      fetchSubmodules = false;
    };
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
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2024-10-29";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "85922dde3767e01d42a08e750a773effbffaea3e";
      sha256 = "0yv3v4nlh42s96r0xa4fvlil4rh4p0q6l50jk8yg0hmc8vxxzbs1";
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
    version = "2024-11-05";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "2971cc9f193ec09e0c5de3563f99cbea16b63f10";
      sha256 = "0cg4w40wmr1k2l5zb25zffpp990wsmi6kq39fvfzy4ay2wx56zgs";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-11-07";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "d01864641c6e43c681c3e9f6cf4745c75fdd9dcc";
      sha256 = "06a3cxizbsjk3fn6ajb2p1pydzqz4ri79qfcl8b5a787r2iflnrp";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-11-08";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "c4279b8ffce9b64eb302056d78dfebc2968a49bc";
      sha256 = "0xcixaanisvg1rhfcgypa7jc6ndp8hmsvwqkcjz1xfypssa99qhy";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-11-07";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "5f0639d68cbea3ab8a9a24a51a5f984d86ea8438";
      sha256 = "00w6as4j19rf2rwwpyf1qjks25yplri2s9qr1y4p5k2zl5iq8f96";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2024-10-25";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "a700f1436d4a938b1a1a93c9962dc796afbaef4d";
      sha256 = "1af5c54ngpfqc5bcvn5xjv93mpxn6k6m583zjyxhwhw2ma7f09zy";
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
    version = "2024-10-31";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "36da8dd0ddc4f88e0beae234c20e75397326f143";
      sha256 = "0f51lxbwqwns60gb32g6ck1vmd6ap5f396v7im0r4v17rx2k5fxw";
      fetchSubmodules = false;
    };
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-10-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "2002692ad1d3f6518d016550c20c2a890f0cbf0e";
      sha256 = "1fwscqdqcza46zhbm76bfhfmz5x92cpl1hl5myfm8zkqax9kxk3l";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-11-06";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "2737edc9e674e537dc0a97e3405658d57d2d31ed";
      sha256 = "1a1ka4l5p51ja8c1lf878nbcz4c45357fvbnsh69g9p1g6f2xgjm";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-11-02";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "f17d9b4394027ff4442b298398dfcaab97e40c4f";
      sha256 = "17jvn969a1174j2p41fiwmw1psljklgxda08n1v7ilnpbwr2ilc8";
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
    version = "2024-11-04";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90";
      sha256 = "037sh4g1747wf07f9sqngiifp89hqww6m2rvizy5ra7jyd04magk";
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
    version = "2024-11-09";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "e3263eabbfc1bdbc5b6a60ba8431b64e8dca0a79";
      sha256 = "09cqxsl5z3wd0kwh57rmr671sl7zd0wdbqkw7kd45w73ayyvam5x";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-10-01";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "ee297f215e95a60b01fde33275cc3c820eddeebe";
      sha256 = "1a92h4yj6vp0mjw3vm2d36qgx14izwbx15sm5mcdwlfa91l0x9m6";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-10-25";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "3e450cd85243da99dc23ebbf14f9c70e9a0c26a4";
      sha256 = "1gn4ph0p36psjc9bdlvs9sg4vm3l9f94wisgxgva5qgh37bs6g2m";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-10-28";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "dca2e998ff26681ee422b92c6ed39b3d2908d8a9";
      sha256 = "192nfbfzjfcjczkj97pxg04jx1g37pv2n86iid1djxy8rnh2yp2x";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-10-30";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "52cc8a1fb35ea6ce1df536143add7ce7215c63c0";
      sha256 = "01anxa0ha9h2rc0dkhxxni1hl1g0kb6xav79bng7qis11jb6sjwv";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-09-23";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "7a79753c1a42c3f52e89a6c42429e7f871e560cd";
      sha256 = "065llk3pbmyrgapa2k835rcf2k7s7b8qfx94jcbqg8v30r6s6ah3";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-10-29";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "04e44b09ee3ff189c69ab082edac1ef7ae2e256c";
      sha256 = "08vf6k69p6gnciawabgy11sd5vy94i8087jxwch07plr9kfginx1";
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
    version = "2024-10-30";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "hover.nvim";
      rev = "f8e162daccb2f117e19f3d5ad3647ac0cefb02e3";
      sha256 = "0wha33yba63k15cv4k7ckbsd6qszfcjb5i4km6i2r98dq59mhar0";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2024-11-04";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "4daf7022f1481edf1e8fb9947df13bb07c18e89a";
      sha256 = "0l3jmqcx17q76bhbww8dwhzif9jcsnk53xwqagdzkb4m6xzywz0l";
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
    version = "2024-11-07";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "8e1e301c2e33c60375850bcf22ba1fb77b684b97";
      sha256 = "1x9hkld6z16sxsj8wvykqyrnqw21dhvib965jzhpk4a106skczh9";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-10-29";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "e2a175c2abe2d4f65357da1c98c59a5cfb2b543f";
      sha256 = "01ilp9nidqaw9am5qdyga14gnnpsqi82f45ng273dqbrfn86n03x";
      fetchSubmodules = false;
    };
  };
  which-key-nvim = buildVimPlugin {
    pname = "which-key.nvim";
    version = "2024-11-06";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "68e37e12913a66b60073906f5d3f14dee0de19f2";
      sha256 = "134k8p7d69mg4k1cnb432bxl8sm7kf2y3hlzwz0jby7nwff99pp6";
      fetchSubmodules = false;
    };
  };
}
