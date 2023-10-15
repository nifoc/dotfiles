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
    version = "2023-10-14";
    src = fetchFromGitHub {
      owner = "echasnovski";
      repo = "mini.nvim";
      rev = "0f93724569ebf27b6b3bc7130d8044a9020a8cc5";
      sha256 = "16alghaa7xkkbzs1ai80shf44yy3w60zzkxjzk2frlkhjnk34w4i";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2023-10-14";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "3af745113ea537f58c4b1573b64a429fefad9e07";
      sha256 = "103spgpvwm4pv32h954sv68p6qjizkm4fdvyzndjgw9x9bah5ksh";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "0ad5ebde070de79ac77fe613e55ac0f632340561";
      sha256 = "10g2saspf6a5skcsjmr92q2x7h2jwaxjbvk778snwg58vass93cc";
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
    version = "2023-10-12";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "cc3fc03c780a14f189290edcf1c47dc1306626d4";
      sha256 = "04njgkrl4afdd0gmhg28jnkll05404650j0903hgjv6hj4a031f5";
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
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "f8fcb0da0618be551560a57fa1457dc6f889e568";
      sha256 = "0nalh47rqfqhrhbpn6v2x9yijfln1kvxd2m676lr2mwf8362ppjc";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2023-10-13";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "3038ffac026a13edaf1bbb898f25d808b6b0c92a";
      sha256 = "1dh3jhfvv0vk1khxi3hfy80xnvk021vj3rrlmj3jjgarda06psmv";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "f1ce55edcbd2c25a544c93357c66d4172a870766";
      sha256 = "0lfnpkf4cah217p1dp8306yy550h2xj0ll1zq0g4nbq4pw2yg149";
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
    version = "2023-10-11";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "74ce793a60759e3db0d265174f137fb627430355";
      sha256 = "1m4v097y8ypjm572k1qqii3z56w4x1dsjxd6gp0z24xqyvd4kpa4";
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
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "2a101fb00e6f6eb29c230736b99f05c3b3192b94";
      sha256 = "1xyxy2qb1h8va74w0ldzh40z7mpqwrvav4qr139f0hmvgrzd0xgq";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2023-10-13";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "a09f8cdd75c546eb024d0f0b5b3ad185f05b738f";
      sha256 = "1ck1f55y19m049bqwb3j77sq5glwafy48w7b01z324qdj68vhy6n";
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
    version = "2023-10-14";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "6d596b87862909370f4d1e6535cc9fad80c89fe6";
      sha256 = "17c16fc94lzi04q7r6yfz50cycq6pbih884gkvlgkyyy92b6bcqn";
      fetchSubmodules = false;
    };
  };
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2023-10-15";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "ea44a6f0a5b8f3924537b004a76e8aef26f2b22a";
      sha256 = "193kcwqsvls6hlw04ibr8n8zhldff30sdn0kf85vvk63jgk0585r";
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
    version = "2023-10-12";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "0fe34b4c1b926e106d105d3ae88ef6cbf6743572";
      sha256 = "06vqg7kq94190vzi8gs1n9a7mjkzhnjfp061xa8bc02qjbi2gj3v";
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
    version = "2023-10-06";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "ff01d34daaed72f271a8ffa088a7e839a60c640f";
      sha256 = "0clyngmmz0qilnjykqc8n7c5kidspywazwy3axsikgh4x8wzdn17";
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
