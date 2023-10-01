# This file has been auto-generated
{ pkgs, ... }:
let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs) fetchFromSourcehut;
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
    version = "2023-09-12";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9ce85b0f7dcfe5358c0be937ad23e456907d410b";
      sha256 = "0772bqmfkx27b6kfn8x28v8ll0qr2zvdclynansraprrzllsqymk";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2023-09-25";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "45d0237c427baba8cd05e0ab26d30e2ee58c2c82";
      sha256 = "0cbp2xv6gnjd1plc8psj0qgwxfrfqw7qg8jn1cgr1la563jjlnlk";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2023-09-14";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "cdce700a688735c594a4978a4ea31801f4354fcb";
      sha256 = "044g9pvwbs88s02f131nvzd69v4c9lw4vavjp37h267y292msbyp";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPlugin {
    pname = "nvim-osc52";
    version = "2023-05-15";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "3e96035d62290183fe7a11418db2b254fcfcaee3";
      sha256 = "12zdrwjlrvzlpwqi757llfvr7ir6ww949i85da385n2crj3jfd8i";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2023-09-28";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "590a713b0372485f595eea36e7e3ab2069946794";
      sha256 = "1mrygmziy880ic91ffr8lyaxd4zb7pgna18ib8qb5a8abfysz9hz";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = buildVimPlugin {
    pname = "cutlass.nvim";
    version = "2023-05-01";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "708864fb2263226aabceaf5b2c2eee9841132668";
      sha256 = "149fngjrvkayj9y1qgyy5f9hr0ysz9chhqm5z573i5q9rgszh27i";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = buildVimPlugin {
    pname = "substitute.nvim";
    version = "2023-07-20";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "89dbe55cccee36bcb5e2be8c2d92ff8716601734";
      sha256 = "01cwgkgf8kgi4x4flwwfaj4qgafvnzaiixn68im4279rm6m1ic6y";
      fetchSubmodules = false;
    };
  };
  leap-nvim = buildVimPlugin {
    pname = "leap.nvim";
    version = "2023-07-23";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "5efe985cf68fac3b6a6dfe7a75fbfaca8db2af9c";
      sha256 = "093fzf1bki2ll3lrqbnrw9w7i7aajbma4zq83c2nkxwi5gj5jqgl";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2023-07-29";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "9fe831e685a76e1a1898a694623b33247c4d036c";
      sha256 = "03mrsy17fvdislkf50hfxp87kw2k53zfyygc21ln11792k2nmfc1";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2023-10-01";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "776e4d341b5416c995e74c3abbf75f9cec26aa5e";
      sha256 = "02pk5di7lxvbwzi2ajq7kj6rfrxd46635jccw6xf5fbxcl84cqsb";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2023-08-02";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "927b41825b9cd07a40fc15b4c68635c4b36fa923";
      sha256 = "11j6l136rskm19p19mjxvws5yp99s3d5h7mg3wq3mka18mcmhv06";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2023-09-28";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "ece052dbcb2b3d2980f0f9881e41277929813644";
      sha256 = "05rc0mgn3jbp1aiac7531cidpc1s79qi1zhj2l7cz9353cfq0j47";
      fetchSubmodules = false;
    };
  };
  playground = buildVimPlugin {
    pname = "playground";
    version = "2023-09-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "ba48c6a62a280eefb7c85725b0915e021a1a0749";
      sha256 = "1vgj5vc32ly15ni62fk51yd8km2zp3fkzx0622x5cv9pavmjpr40";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2023-09-29";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "ffe90fac32122f401429b14d383137bd92a685d0";
      sha256 = "1wf2kq3pv98fzy12hv19jg80r9phr96j2x5qvzbqfagglc1zb3jf";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = buildVimPlugin {
    pname = "telescope-fzf-native.nvim";
    version = "2023-09-10";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "6c921ca12321edaa773e324ef64ea301a1d0da62";
      sha256 = "101dxn7jfyg2wdzkw5cnrw475mg0p3w475l1hplqfhghz33zb1hy";
      fetchSubmodules = false;
    };
    buildPhase = ''
      make
    '';
  };
  project-nvim = buildVimPlugin {
    pname = "project.nvim";
    version = "2023-04-04";
    src = fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb";
      sha256 = "1md639mcs3dgvhvx93wi0rxiwjnb195r9al9bfqvcvl3r307gxba";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2023-07-28";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "3094ead8edfa9040de2421deddec55d3762f64d1";
      sha256 = "0qmx94fq1pllwnwzav87fi3v9d64sm8ggv9jgs19flr6r8kh0vs2";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = buildVimPlugin {
    pname = "telescope-ui-select.nvim";
    version = "2022-04-30";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "62ea5e58c7bbe191297b983a9e7e89420f581369";
      sha256 = "09mbi1x2r2xsbgfmmpb7113jppjmfwym4sr7nfvpc9glgqlkd4zw";
      fetchSubmodules = false;
    };
  };
  telescope-toggleterm-nvim = buildVimPlugin {
    pname = "telescope-toggleterm.nvim";
    version = "2022-02-10";
    src = fetchFromSourcehut {
      owner = "~havi";
      repo = "telescope-toggleterm.nvim";
      rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
      sha256 = "04vn8807gmhahhap55xjbabarlmqf05ygwqycsfkdcbm5jpcxdnw";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = buildVimPlugin {
    pname = "telescope-undo.nvim";
    version = "2023-06-03";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "3dec002ea3e7952071d26fbb5d01e2038a58a554";
      sha256 = "1331qgsfxy1qsvxlkss2g713qlj2ri02ywbhiwwy5cyl8bc0rl76";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2023-10-01";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "eb1b53162755888ff75e495797071644d983bff7";
      sha256 = "04kgsf3rhr0wk3vyx6lawlxj5icvaryx925flh72f234vkhigmq2";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2023-09-19";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "3ca419c52a7c20a2565237db2c110ed68fc7e6f1";
      sha256 = "1jy5yklfc3fvajy5mqwfi4h6p5bxb71ar1hnck8k8hciggrijhrq";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2023-05-05";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "57610d5ab560c073c465d6faf0c19f200cb67e6e";
      sha256 = "18lpp3ng52ylp8s79qc84b4dhmy7ymgis7rjp88zghv1kndrksjb";
      fetchSubmodules = false;
    };
  };
  nvim-navic = buildVimPlugin {
    pname = "nvim-navic";
    version = "2023-09-18";
    src = fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "0ffa7ffe6588f3417e680439872f5049e38a24db";
      sha256 = "04fd7gcs6hhc44pya1k8ds332hm1jpg44w3ri14g3r2850b8b02z";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = buildVimPlugin {
    pname = "vim-illuminate";
    version = "2023-09-26";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "1b5d70332a51a1de05f281069851865a2bb1e6d7";
      sha256 = "0dbbak53d5hi8jkp0wxcb3x6kysdi7ry2w1k9n0lj64qkmp5afnb";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2023-09-30";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "1065763f115a7765ef237347ad676ba348d7193a";
      sha256 = "0wlfq7xpi60nrqxx2v0h2pjv9jhx5alir8z9q1h7vcnf2hykj45c";
      fetchSubmodules = false;
    };
  };
  comment-nvim = buildVimPlugin {
    pname = "comment.nvim";
    version = "2023-08-07";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "0236521ea582747b58869cb72f70ccfa967d2e89";
      sha256 = "1mvi7c6n9ybgs6lfylzhkidifa6jkgsbj808knx57blvi5k7blgr";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2023-09-25";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "480b032f6708573334f4437d3f83307d143f1a72";
      sha256 = "0ckysmd0612ssia9d5bvdz2p91zcfs6ak3q14aps4cn9acbzkfp6";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = buildVimPlugin {
    pname = "friendly-snippets";
    version = "2023-10-01";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "43727c2ff84240e55d4069ec3e6158d74cb534b6";
      sha256 = "1sjk17gn919aa84dkjfagwwjsas9zfkbrk840bjf580k8m83d9m8";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2023-08-26";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "5dce1b778b85c717f6614e3f4da45e9f19f54435";
      sha256 = "1yl5b680p6vhk1741riiwjnw7a4wn0nimjvcab0ij6mx3kf28rsq";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPlugin {
    pname = "cmp-nvim-lsp";
    version = "2023-06-23";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "44b16d11215dce86f253ce0c30949813c0a90765";
      sha256 = "1ny64ls3z9pcflsg3sd7xnd795mcfbqhyan3bk4ymxgv5jh2qkcr";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = buildVimPlugin {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2023-02-03";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1";
      sha256 = "0bkviamzpkw6yv4cyqa9pqm1g2gsvzk87v8xc4574yf86jz5hg68";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = buildVimPlugin {
    pname = "cmp_luasnip";
    version = "2022-10-28";
    src = fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "18095520391186d634a0045dacaa346291096566";
      sha256 = "0b91ap1l3nph46r7b5hcn7413yj3zhrz1jmn4xqp387ng35qz537";
      fetchSubmodules = false;
    };
  };
  cmp-path = buildVimPlugin {
    pname = "cmp-path";
    version = "2022-10-03";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
      sha256 = "18ixx14ibc7qrv32nj0ylxrx8w4ggg49l5vhcqd35hkp4n56j6mn";
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
  cmp-treesitter = buildVimPlugin {
    pname = "cmp-treesitter";
    version = "2023-04-06";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "389eadd48c27aa6dc0e6b992644704f026802a2e";
      sha256 = "0kbxjpw7j90pgvwmx3cb47jkk01wx5q6fqr660llinqc1vmj1rsq";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = buildVimPlugin {
    pname = "cmp-cmdline";
    version = "2023-06-08";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "8ee981b4a91f536f52add291594e89fb6645e451";
      sha256 = "03j79ncxnnpilx17x70my7s8vvc4w81kipraq29g4vp32dggzjsv";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = buildVimPlugin {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2023-04-01";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f0f53f704c08ea501f9d222b23491b0d354644b0";
      sha256 = "1zcplbb2kkq3f9mmy6zfgscdiccqiwkjr4d91qqjxp80yi1v9z4j";
      fetchSubmodules = false;
    };
  };
  core-nvim = buildVimPlugin {
    pname = "core.nvim";
    version = "2023-09-09";
    src = fetchFromGitHub {
      owner = "niuiic";
      repo = "core.nvim";
      rev = "dc1046613c7a0ce664b6ec3d5c8c94d6b6d2618d";
      sha256 = "0lgg800rcrkg99wg7spj1r9ykyx31zr07f57ybyqaxwd7z0sx260";
      fetchSubmodules = false;
    };
  };
  format-nvim = buildVimPlugin {
    pname = "format.nvim";
    version = "2023-09-17";
    src = fetchFromGitHub {
      owner = "niuiic";
      repo = "format.nvim";
      rev = "5bc6846406dcb791edbf02f847fc687b74c45ec7";
      sha256 = "0jizp5hb0clcdbl965b4pbci1cch00mj07w1cbg3j3yaz7d9lwf6";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2023-09-23";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "de4f7138a68d5d5063170f2182fd27faf06b0b54";
      sha256 = "0ppip04x0z98aq7b0zpg1yyy2cgqr94jgf5dy2dr1wvgrjh9lxhd";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = buildVimPlugin {
    pname = "nvim-ts-autotag";
    version = "2023-06-16";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "6be1192965df35f94b8ea6d323354f7dc7a557e4";
      sha256 = "1j47gcybag2qk87qc4karwdvzhvi485x7m80n2sj27rrh1fyv972";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2023-09-02";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07";
      sha256 = "1c0rkdr0pjrrplvr5adnb0q9vkq11kr7m5mvlggm633g45khjw5l";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2023-08-30";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "bd103502252027434ec42f628d2dbf54821d4ce6";
      sha256 = "030z020v4g140a72mv1q7l6bshhrkgisbd6w3hiwlv9a1mgz4bbc";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2023-08-18";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "1c2ef599abeeb98e40706830bcd27e90e259367a";
      sha256 = "06j190qns6fscxp7mnr6zl5bipzbc4w478z5x5g2awghc0iwzkcr";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2023-09-03";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "7f1e805dfc001d5dbb7d894105063f463f6c7dcc";
      sha256 = "1hy5a30pb0cv93dh796lh08p5k43b4b732sr4ka0pwj4n4a3q82r";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2023-10-01";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "3d26bc7ab0e8dfddc0f40c840a8f925dddc2fef6";
      sha256 = "1p3bxdrj2xibyqw37b1247sz5nqx460d3lr4py3fn0cdgrf3420s";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPlugin {
    pname = "virt-column.nvim";
    version = "2023-09-19";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "5fc72873dc3175eddbdbbedea8071919c99ad755";
      sha256 = "071cpga3fapqqpifd04hc5fwsq5v27p32vhli5zy8b8awg1qw9sm";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = buildVimPlugin {
    pname = "toggleterm.nvim";
    version = "2023-09-25";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "61e8ad370d4da5d84c77e31671027bc094ac06ca";
      sha256 = "0cwqlaqvbnw4ncm717v052mzb943jcynrfpx38c8aspzjqybdcpj";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPlugin {
    pname = "urlview.nvim";
    version = "2023-09-19";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "bdbdf1e020e283551f003e71b0004096c746ef57";
      sha256 = "1bf226s400vyjffr6zqx9kr52qznzcgx1jnh356vfx3fjxsq81nl";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2023-10-01";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "19654d963e4f1d6d6543f38ab9802092393508c2";
      sha256 = "1w2kjiiz5ac0qkp6q33gk70lghahxm41f0hjf6mkbk0x74aqj7ks";
      fetchSubmodules = false;
    };
  };
  nui-nvim = buildVimPlugin {
    pname = "nui.nvim";
    version = "2023-09-06";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "c8de23342caf8d50b15d6b28368d36a56a69d76f";
      sha256 = "0na7mi192alj1pyskdyivn12a0nmcmzy79kmqxyz8r1cijgb33q2";
      fetchSubmodules = false;
    };
  };
  nvim-notify = buildVimPlugin {
    pname = "nvim-notify";
    version = "2023-09-28";
    src = fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3";
      sha256 = "1a7s4y8xd1plcidnzs29rhqw7mfbj1q01bqffqjmimii9v6azmfn";
      fetchSubmodules = false;
    };
  };
  noice-nvim = buildVimPlugin {
    pname = "noice.nvim";
    version = "2023-09-25";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "396f9146529130904e07c45e90ecdbfa607534f3";
      sha256 = "0n7z491mg9wlr9vhpzanly9ywykbjavv04qk1f5msj5i5r613jh9";
      fetchSubmodules = false;
    };
  };
}
