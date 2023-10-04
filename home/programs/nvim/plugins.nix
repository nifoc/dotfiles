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
    version = "2023-10-03";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "c54a43cb377710b17907be8c863967fee1ffc4ee";
      sha256 = "06jfhdxvvzs2jamf7g4nin9yxlhiy52fx5602k6ccvid0bbk85b5";
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
    version = "2023-10-04";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "06fa0a023459b43f86438a751275645b7f3163f3";
      sha256 = "0kmwnpiblzw56ap91s5yipx9m85vzs680bz78qd8m58hl233ghwx";
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
    version = "2023-10-03";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "652345bd1aa333f60c9cbb1259f77155786e5514";
      sha256 = "0zw1q7nj76dvvnrb539xc11pymhjbgdjd54m2z64qxbi4n5qwryr";
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
    version = "2023-10-02";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "8c69f58427f98b2ca39a90a36db830c06e30351c";
      sha256 = "00hh8v7nlvw800cjvz3j86myb6m4i6irss4kylbg15ypsp5p9yx9";
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
    version = "2023-10-03";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "361a2878a41f23452457eec12a807ff59bc75882";
      sha256 = "0pss0c3kshpil8dam9ajrmcazyhq71g1nvhb5ww79aawi7k9bvps";
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
  coq_nvim = pkgs.vimPlugins.coq_nvim.overrideAttrs (_: {
    version = "2023-10-04";
    src = fetchFromGitHub {
      owner = "ms-jpq";
      repo = "coq_nvim";
      rev = "8bfc8742f32e30adfc92111ff3ebe53b95e3b271";
      sha256 = "1sp2qi610j1584s0wl5xfg8kghnr1wcf553xsjxgp9ylxyzsbawp";
      fetchSubmodules = false;
    };
  });
  coq-artifacts = buildVimPlugin {
    pname = "coq.artifacts";
    version = "2023-09-07";
    src = fetchFromGitHub {
      owner = "ms-jpq";
      repo = "coq.artifacts";
      rev = "469c27eb84a91fe2721b6c0af57703ffa1e785e9";
      sha256 = "0v902lf7l0590nif3g45c5ad0s1wr9v7bz0g733aji9hh3fcxl8i";
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
    version = "2023-10-04";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "fd30910d517aa8aa98c64f1a96bc1857f411b895";
      sha256 = "059zyqr9jby7mm8i9zwv15l9jzw71q3qbl71c4vi2fi6ml92g1c0";
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
    version = "2023-10-02";
    src = fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "c80844fd52ba76f48fabf83e2b9f9b93273f418d";
      sha256 = "19rbq39m7c1v9yrfmlwmfmxgv5d9bwcjbgjdp3cin409fnl4rv6b";
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
    version = "2023-10-03";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "2272cf9f0c092e908f892f5b075e6cc2a8d3d07d";
      sha256 = "1dxcd2h7gahpsdgabbknjw568bdd3fxsydwynvz67qjz6xss90b3";
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
  nvim-lsp-notify = buildVimPlugin {
    pname = "nvim-lsp-notify";
    version = "2023-03-19";
    src = fetchFromGitHub {
      owner = "mrded";
      repo = "nvim-lsp-notify";
      rev = "9986955e0423f2f5cdb3bd4f824bc980697646a0";
      sha256 = "06zaydcsmmdblqvrkiv827lv3z9smf90v57f62fqgbxn5rhx38r7";
      fetchSubmodules = false;
    };
  };
}
