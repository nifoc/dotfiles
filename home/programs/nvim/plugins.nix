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
    version = "2024-04-25";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "08e301982b9a057110ede7a735dd1b5285eb341f";
      sha256 = "03x9mxxqscahs3plml9pw0q6yacyiz6nvw4pcbpqlcqj99f0qbdz";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-05-13";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "e37bb1feee9e7320c76050a55443fa843b4b6f83";
      sha256 = "0kxj9xj94zln8ah2i0r09p0c8prn0rs1vwgf5dvmjn3j8m4x3nnn";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-04-01";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "86bd73e14a695e88922aac4cf84f38a08911df63";
      sha256 = "0rk9zvqxh8c7vpd1l7994ccykqwapff5d3i46pcmdhz5bc32c70w";
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
    version = "2024-05-15";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "ec4353355d4eabef451d16d46a3e0535176b81aa";
      sha256 = "04wgkw03xxlwy1cvjrvdssfw7v5q1alb2wbk0nawhca5rv27r2p4";
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
    version = "2023-11-17";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "17ffaeb5a1dc2dbef39cf0865d8a4b6000836714";
      sha256 = "0jf6r6zxgr4709lfl2ry7z8qh4zql8w4x56bqj0jfkga35l9c7c1";
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
    version = "2024-02-25";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "8d8bddb8814c3e7e62d80dda65a9876f97eb699c";
      sha256 = "0jj60j09k1pdkjqdfj7akxrfwpaccvc2z2r3ksj3zm1gjrnfsyi3";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-05-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "aa0c7dd29631ee8c2df738d99bd33b762b3a6e22";
      sha256 = "0jqpsr9p07cyx7a1ph7f4x3v7pp31n3lbxy3bxzyh2bb6jxnmj6z";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2024-05-01";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "a621ede3bcf551144358c112ba1f4e6c2e84e092";
      sha256 = "1ih2jd14faq80jdxrz42pdmcnz3k5pl4h5hn90x03w1m14bkpmxz";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-05-11";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "dd1156723eb8483e4403eb8765bbdff456b6981d";
      sha256 = "11fjiz7zcvs4fbp71yw5ky7gscgdbq4vzdzfc5ladhh6h0jayix5";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-03-27";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "a7e39ae9e74f2c8c6dc4eea6d40c3971ae84752d";
      sha256 = "1z6d0cc0vjl504var8p4l6wshbs5i447wg7y7rmk6i4kb39m94q4";
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
    version = "2024-05-16";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "52f500110bcf9190b44b4d8640162adc86772ec4";
      sha256 = "0l3vd9xabwx40rqmmwzj1sgnn62z0gg174yl2gl7k2w935nj707z";
      fetchSubmodules = false;
    };
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
    version = "2024-05-01";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "95b61c01ea3a4c9e8747731148e905bbcf0ccaee";
      sha256 = "17imd6f1qykxv4wk67ihj7ir07yvcmrr0cqvidv1as3k77riclxb";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-05-14";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "a27179f56c6f98a4cdcc79ee2971b514815a4940";
      sha256 = "05330mxn5xsfmfm7pizi9bz6i0l7ksixmjxqckqvjspiyi8kqslj";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-03-07";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "8eb5f0dbe6e126b392ddcaf45893358619893e45";
      sha256 = "04v31198sqrw18ycrxhz94zq4q9bn879cdlyc06f8fc2hwqnz1ya";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-05-14";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "3c32d6a7bc56d56d4e3cc16fb21b59465a527aeb";
      sha256 = "0z4s60ahpm7scqqajli95jcjafcza37wwjh8lzhlydc2zy7xg4z0";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = buildVimPlugin {
    pname = "lspkind.nvim";
    version = "2024-01-11";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf";
      sha256 = "0sjd244122q7hs3xaxzxhfcfpnzjz082rbnishq6khnr9w2xs0px";
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
    version = "2024-04-18";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "e522e0dd742a83506db0a72e1ced68c9c130f185";
      sha256 = "0l9306c3867r6dqn4272kkzql63pwfaibhdwisjlc7pcv9wzah53";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-05-13";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "f3bcc28ffccb768212247294acccc106e029fc3c";
      sha256 = "0q4fq77v2imls0plcasgmrxbpc3q8qddn6n3w42xygkm9bna8a01";
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
    version = "2024-05-14";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "7b1dda0dfdefc10b2501295eba5e463dbd7c338f";
      sha256 = "0kxhifaji60hzxd7js3wl1bl802n25a22jyivhc5w6gxsilb9s09";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-05-12";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "24122371810089d390847d8ba66325c1f1aa64c0";
      sha256 = "0s4va3b06agy070fkqghx460q20jddvni14gbvjdvgkaf56xn8f3";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = buildVimPlugin {
    pname = "cmp-nvim-lsp";
    version = "2023-12-10";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "5af77f54de1b16c34b23cba810150689a3a90312";
      sha256 = "03q0v6wgi1lphcfjjdsc26zhnmj3ab9xxsiyp1adl3s1ybv22jzz";
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
    version = "2024-05-13";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "59d0dd233a2cafacfa1235ab22054c4d80a72319";
      sha256 = "0kh6hylhzqr7jl6b1gmjpyjipxb589hp93vdrk11gz3vk9ricjn9";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-05-16";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "b0b79e42a28f09719a7da9534c3731fa37319d9b";
      sha256 = "0xaaazahwc4f5d1vb8g0y4gz70wqc65gihf7512r8llw3c5diix9";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2024-02-24";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "2d660e4aa7c566014c667af2cda0458043527902";
      sha256 = "0a5527gmwf0chdn91s2s8pa7iny3qa5a88c413g4vwch12mn2vrj";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-05-15";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "84cc9ed772f1fee2f47c1e076f518829583d8347";
      sha256 = "0z08c1yz3sn4cdijj9k61zjrny8wp7q1gq1jz9knwg327slm0syd";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-04-30";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "6d0dc3dbb557bcc6a024969da461df4ba803fc48";
      sha256 = "0ig2izp7jhahri926avzwpzz9qklbnvpma6n9m7mfipf7jcn95rw";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-05-15";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "f630887cd845a7341bc16488fe8aaecffe3aaa8a";
      sha256 = "0d28rx4qqqha9ikcajx7yka0kzbf93yfqhkvmsykm0855h88ivx5";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-05-12";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "c52391dc4428d503f65e6bcb1533e6334f22a136";
      sha256 = "0hplfmqy9gx21ifqyj23ydq7zsm9v0kfhhqb4s9bjb1djx9209j4";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-03-14";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "3d08501caef2329aba5121b753e903904088f7e6";
      sha256 = "09p7y9d08sb1fqpy84yga39cf9misir6wx3rby67v2pl3i01k7sy";
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
    version = "2024-05-06";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "805610a9393fa231f2c2b49cb521bfa413fadb3d";
      sha256 = "0cxcq40i84l1jblvvn913hiz9qik62g0iij097prxgz2jx66lvdz";
      fetchSubmodules = false;
    };
  };
  diffview-nvim = buildVimPlugin {
    pname = "diffview.nvim";
    version = "2023-11-20";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "3dc498c9777fe79156f3d32dddd483b8b3dbd95f";
      sha256 = "1zvgm0icmc4z48vnd6pn7pvl6sg89mm4symr0rwiix8s942nfiyw";
      fetchSubmodules = false;
    };
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-05-13";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "eedcb6b954432b7d1901dd7e3758d829b4e8f20d";
      sha256 = "11pdlqhzw4kmrhdfb03ajvh3ay2r9s3h1ivqccihbkv6lich5831";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "1ba38e4cbb24683973e00c2e36f53ae64da38ef5";
      sha256 = "0g0z1g1nmrjmg9298vg2ski6m41f1yhpas8kr9mi8pa6ibk4m63x";
      fetchSubmodules = false;
    };
  };
  which-key-nvim = buildVimPlugin {
    pname = "which-key.nvim";
    version = "2023-10-20";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "4433e5ec9a507e5097571ed55c02ea9658fb268a";
      sha256 = "1inm7szfhji6l9k4khq9fvddbwj348gilgbd6b8nlygd7wz23y5s";
      fetchSubmodules = false;
    };
  };
}
