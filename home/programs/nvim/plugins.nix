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
    version = "2023-10-11";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "50012918b2fc8357b87cff2a7f7f0446e47da174";
      sha256 = "1sn7vpsbwpyndsjyxb4af8fvz4sfhlbavvw6jjsv3h18sdvkh7nd";
      fetchSubmodules = false;
    };
  };
  mini-nvim = buildVimPlugin {
    pname = "mini.nvim";
    version = "2023-11-11";
    src = fetchFromGitHub {
      owner = "echasnovski";
      repo = "mini.nvim";
      rev = "f2b89efbbad1943657e43f474fe308fceb63597e";
      sha256 = "1yyqb3plmzmfpidcij66j3mcg37ysf3bs1s5wyyi7hxqw6hqqhk4";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2023-11-11";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "3fafeea5f339223e888fd15eb4032260849cb038";
      sha256 = "14vwqj74icbh1zk23k833jfprh4bdb7yq850c4rn7cs6bl06nwrp";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2023-11-02";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "2aacd6405c52ef4b865a7baf2598fa3d7b0bc25c";
      sha256 = "1g43hyf7cmgr6vk59s7v4g5g4r0k8cm7bcki1klx40vqmlpq6rk5";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPlugin {
    pname = "nvim-osc52";
    version = "2023-11-12";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "89307570b3bffe115d8b6b6fd3a4066cde0ba2d7";
      sha256 = "0alsh1r6c5b8zf3jcymmrp921mmmhvws38ih9hbw5yffcy0lqhl2";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2023-11-03";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "9268018e92d02650a94e39dd5f5903c542f7ea11";
      sha256 = "07blik6lsj1qdk5y3afjc80a0rbjjxq68q3fkvkayn5zs41i76y2";
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
    version = "2023-10-11";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "cf35db50188f3d7de624ae391c9bb9f2e9de5610";
      sha256 = "0v1svihxdh74ip1hmbc2aj95znlgvgb8z7ifxyz5sb1bk774460h";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = buildVimPlugin {
    pname = "dracula.nvim";
    version = "2023-10-26";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "7200e64c589f899d29f8963aad7543856d1c2545";
      sha256 = "095jnw5wmphr7fp4n63sdjh787hlvhpz4baqcvcy7n90aiq3r3sq";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2023-11-11";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "075a64addc33390028ea124a1046a43497f05cd1";
      sha256 = "1rkwc97h9pnxrzqq1bp72cr6182rvh0bi3c9dfq91q51g70a651h";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2023-11-08";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "743cbe28d8e6acd82eb7db6bac11c50661ec16a9";
      sha256 = "16vdabnq8rxkbi5bccr0fjxjhm0n7d3r1sdx1459s4b5h6his9bw";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2023-11-12";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "9492c13ca9ef0b96bc9fac2b2724f5b20096df51";
      sha256 = "0jjg7g3r6a7g8rbijah038r4gx2a72szx5p2w65lnhmi26b3ps3v";
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
    version = "2023-11-06";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "20bf20500c95208c3ac0ef07245065bf94dcab15";
      sha256 = "096vv98xxdqy96ipz6lbricfr74bkc3r58x1si1816lnm0j896r5";
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
  telescope-ui-select-nvim = buildVimPlugin {
    pname = "telescope-ui-select.nvim";
    version = "2023-11-08";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "0fc69ebbf178631b8ab76745459fade062156ec5";
      sha256 = "16ri6gxy4pgjf2rxxnd6p0i1ibaz08sd31n2v40n6y84is2nywrd";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = buildVimPlugin {
    pname = "telescope-undo.nvim";
    version = "2023-11-12";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "13c33c173e53f14df7eec5155c52a3d2ab022d8d";
      sha256 = "0bc3c447491pbp6l20gn4kwd9n7wm4ayac0imsvswpmnvlrh0ibn";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2023-11-12";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "90a28fd7637b66e055af62387ecee06f7cbd3173";
      sha256 = "0vzvbw8fh2j1l1sjkk5dfj5l5yghp5fk9pparvar1cyadpa6mcsh";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2023-11-01";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "503a399e0d0b5d432068ab5ae24b9848891b0d53";
      sha256 = "0qq8sr32k9wv92km71h5clpmhsnck3i0dj40qapabb3iaw8iwhwf";
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
    version = "2023-10-06";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86";
      sha256 = "0x3li63dijw9z4imbajpxbrclw32649810bsnx5cawrqgbc7kl99";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2023-11-10";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "775ae0e5a451dd6c5d15de7a828ea72d2c54e8cf";
      sha256 = "1ldbq4qfajysfrplawba8jv6v6lcvnvfz18pas198npn2gp9kgna";
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
    version = "2023-11-10";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "46c91e814732c1630b8a8b50d04acbf54b8320fa";
      sha256 = "12xr9i58037zx6cnggn36490lpdl22fjk5awix040dv2v5idchj0";
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
    version = "2023-11-06";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "0b751f6beef40fd47375eaf53d3057e0bfa317e4";
      sha256 = "1qp7s2iam9zzdlw5sgkk6c623z7vjgga0rcg63ja0f836l90grba";
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
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2023-11-12";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "ca3dfba94600aa62bfc88ae37cbd4f17eaea2553";
      sha256 = "192r845pyszbl5jwxzs36pvjn4c4si4n0ywnqlia0w03vac4zz8g";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2023-10-21";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "0f04d78619cce9a5af4f355968040f7d675854a1";
      sha256 = "0k2pibxx42qsdvxgbrdj7g44y5q6dnaw0g07gq025dpn27jk9ark";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2023-11-05";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "d30b72d20f01478a8486f15a57c89fe3177373db";
      sha256 = "0zlficdwybcz8mvzv70vp4mkzrwpmvp3v0dq88fyimyajyxi1aqp";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2023-11-11";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "cfa2da7f469f1e759f2a961bc25fa4ccfe1795c2";
      sha256 = "0r1nm8l736vvrxhqnszk65siphkn59473y88qahxzhfj4b98qgd3";
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
    version = "2023-10-30";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "29be0919b91fb59eca9e90690d76014233392bef";
      sha256 = "0z8n9d6f4qiq8m4ai1r2xz90955cp6cikqprq74ivfch3icrzdi1";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = buildVimPlugin {
    pname = "virt-column.nvim";
    version = "2023-10-05";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "9c82009c53e5f9d43b6c0f5e8cb69c53663b786a";
      sha256 = "17ja20ya03jg9qrg3pnhzq33j2vqp99837ikky4di9i7akly4k30";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = buildVimPlugin {
    pname = "urlview.nvim";
    version = "2023-10-29";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "7d622e11adbc2cac5bba62345ade9b6672d564a4";
      sha256 = "1cqzvbglqjy4563p4q08lsy3yhbsvn8i2davjlgplxvnvb76i68d";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2023-10-26";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "af0f583cd35286dd6f0e3ed52622728703237e50";
      sha256 = "04qr0zm8cfrsf306jswah4cja8dsih3b41ikakcbvgq08qsngj86";
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
}
