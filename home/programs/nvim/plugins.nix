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
    version = "2023-10-29";
    src = fetchFromGitHub {
      owner = "echasnovski";
      repo = "mini.nvim";
      rev = "9b379d3bb8aac34015f27acd0e981d67e334ab12";
      sha256 = "0ldvs3dks1graa9mf9wljd8frd5x9lnxj6mprh9ikfwxi9aabyvd";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2023-10-24";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "5de460ca7595806044eced31e3c36c159a493857";
      sha256 = "1ncwiha8ldxzx1g1hfisrgsvnqv05p7c19glbjp5bwbm5ihfsv04";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2023-10-18";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "16db1f5face4f211dedb0581ec38dbfd12d1c7b0";
      sha256 = "0m3zljbdi7bbhjac8q9s7glfx1blzc3jjkb7j0k3nljd61mr8nvy";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = buildVimPlugin {
    pname = "nvim-osc52";
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "5689dc08ee1ade3feb7f74bdd6e539fba70f3064";
      sha256 = "0pq68f0rfvvxw3y9kkwhqxrlvyk8gjfn8i8a06pb7m9k91r2qm5s";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = buildVimPlugin {
    pname = "yanky.nvim";
    version = "2023-10-17";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "c1211c6c6d983a72c74dde44df8575a64d50562f";
      sha256 = "1n0mgvc7kvg6ciw8m8lgy6bkbl75m95y4fq11y6yb6byiqpraimg";
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
    version = "2023-10-31";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "efec7115d8175bdb6720eeb4e26196032cb52593";
      sha256 = "0zby6aa40ivr294hdbxyzh5pgb5jayv5infsqay1mxqpvp1pywca";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2023-11-01";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "f25560bd859b0a67f4a0d6de8b64d2169d7e8519";
      sha256 = "00agr6n5m9zqi6frmm4f7h4gi7gjznqwg9jpa94wg2n8vdwbl1iw";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2023-10-29";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "df8cdf68234fbf056202a9684931c3dfa89988c1";
      sha256 = "03hmkdkny3rfhprjimxala058b31das66iqzkghm99jw7mbrd4xc";
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
    version = "2023-10-23";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "4522d7e3ea75ffddabdc39957168a8a7060b5df0";
      sha256 = "143bdqxfzlfbjrd80pw4wkz95szp21qs1zn7i230sdavvrq00b3b";
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
    version = "2023-10-11";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "b0015e6e4b46a64192c64b68dec9a9ac5a4e5690";
      sha256 = "1r8c29c6gd870ch7iyiln83y01hp73sgyh2rzq3cfzj4nx7fvgg2";
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
    version = "2023-10-29";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "d0467b9574b48429debf83f8248d8cee79562586";
      sha256 = "0iln2vhg9v11nwn0ry2xkyds2894d5bs2giqhf0lqif56rs3yapj";
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
    version = "2023-10-24";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "962a76877a4479a535b935bd7ef35ad41ba308b2";
      sha256 = "0kgw26b367y7aaz1i3ckxkhfk0f4i2s11lcyfvl9zczzjqaqks8v";
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
    version = "2023-10-18";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "80a8528f084a97b624ae443a6f50ff8074ba486b";
      sha256 = "16daainc44r8ijypp2ksm53sscjil603xw73ry7nd5x54iar06f9";
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
    version = "2023-10-25";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "51260c02a8ffded8e16162dcf41a23ec90cfba62";
      sha256 = "0h5n8ks34vxr2b17vddrv4vgjyr649bl7i839awpad21x146krkz";
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
    version = "2023-10-31";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "2c1e852fbf723b7d89b14fd28089472d92edeeb9";
      sha256 = "1d899gl06zsyygssbzbdmd6aymv8n7ralvlws3gv80yhqyx1s494";
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
    version = "2023-09-02";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07";
      sha256 = "1c0rkdr0pjrrplvr5adnb0q9vkq11kr7m5mvlggm633g45khjw5l";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2023-10-23";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "4f0e1f470595af067eca9b872778d83c7f52f134";
      sha256 = "16q85dd79rdn1v7wqshzhjgrsgbnzk04l4vjgp6g9hbj8p8sna4k";
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
