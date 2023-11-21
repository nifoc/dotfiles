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
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "echasnovski";
      repo = "mini.nvim";
      rev = "05f4a49cd85a67b90328a1bcbae4d9ed2a0a417b";
      sha256 = "1m1z451p8bx5x9cal3a1yy3a28sjp7pmsisrfgsy2vckkxqf8m05";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "cdbcca210cf3655aa9b31ebf2422763ecd85ee5c";
      sha256 = "18bxb2zg55ccjzj7q2kyv3bhyxagf3pm89zqhmwy45n0ng9vmn89";
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
    version = "2023-11-17";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "17ffaeb5a1dc2dbef39cf0865d8a4b6000836714";
      sha256 = "0jf6r6zxgr4709lfl2ry7z8qh4zql8w4x56bqj0jfkga35l9c7c1";
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
    version = "2023-11-21";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "7da3cb6323d1e1fbfc4d7dc05cac74946458b8a0";
      sha256 = "1bmr1j6s5r8ig3s2i2qgnr5if8vrqbmf34qk2g74mvqnl38gadyl";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2023-11-16";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "fda7259fc3b16af1d16e467c1482aac3bcc4df9a";
      sha256 = "0rfj8hknzwjp59x51wf99j4ymda4gnc2ly1rl3185dw4p3v7n4ph";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2023-11-19";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "c6dce365e647162ae0031c1f814053beaf3dd843";
      sha256 = "07px1wk23p0sxvh7sv7gki0pp0mv0618kfgl7c6s5ylrpw6a11wq";
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
    version = "2023-11-16";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "18774ec7929c8a8003a91e9e1f69f6c32258bbfe";
      sha256 = "1vihb6l5xiqbrs1g4c1blpkd0c995hwv2w6sr5b86zzmk70g0c7k";
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
    version = "2023-11-16";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "d3afc1c105535a90caec092ce27a113f77ba7b84";
      sha256 = "0cpkjl6pffwdrh1hawpd042gpnyqbg2r8f1nz0fwdk175bgsx2s8";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2023-11-21";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "addad5176dbbe8bcc82ef91c51c5f1bf6629ec2d";
      sha256 = "166fwrhrfqr21sy1w25x2pdrk5q5g1bcnsm98j9gsd7wnabqizqg";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2023-11-21";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "44403b2ef6c6285cfd9a3b4fa9a0d746ddae4b45";
      sha256 = "0d6icxcy9rx7dcdx821apwz1mrdl3vr3s547y9xw1m7idljij1cv";
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
    version = "2023-11-19";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "3a7c15331a57ba40a56f00f29173700af853fa03";
      sha256 = "13h8s0cpgv2l6y1p54c9a4hncqh64zlrx07zy7k18xhqsz461c69";
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
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "cab667e2674881001a86a7478fff7dc7791c63f5";
      sha256 = "10ij1bd3rdbyc87rlnq89h59gxmz6kfpq4wqbdhy9cml996ixpkp";
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
  cmp-async-path = buildVimPlugin {
    pname = "cmp-async-path";
    version = "2023-01-16";
    src = fetchFromGitHub {
      owner = "FelipeLema";
      repo = "cmp-async-path";
      rev = "d8229a93d7b71f22c66ca35ac9e6c6cd850ec61d";
      sha256 = "18z548v4ypby32jydq439zdi6gv7zybp8gk957iai22cnxaj403n";
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
    version = "2023-11-21";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "a5df96556c4c895777bf53177a8704b9b3e884e1";
      sha256 = "0qg0mcy7i00p93vqycq1nx7svfn758a3qy30lkwgkydvz4g8nhzg";
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
    version = "2023-11-13";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "0855a89e00a5822c3a482a82e5223fcf2e9ede13";
      sha256 = "09riinjjh96nrs357ay886j8gs6cgkhj3zwngm44pf8p04w2w81n";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "05cb8257cb9257144e63f41ccfe5a41ba3d1003c";
      sha256 = "0y2lfdx75d418jdypp1yg3sdmr88csb4z3p1dnxnggx4xk1yghrx";
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
    version = "2023-11-17";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "0ccd5fb2316b3f8d8b2f775bc31cae7bc6a77a55";
      sha256 = "0xgw0p6wb33wlb4lnnjj1adxsll6lnmq3niabqzricsz4phmvf4f";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "a1493d94ecb3464ab3ae4d5855765310566dace4";
      sha256 = "09hr2l3y0b4j3r308xqmj0pa8nqsx13x1g2ar3bpyj5dz42m8kgg";
      fetchSubmodules = false;
    };
  };
}
