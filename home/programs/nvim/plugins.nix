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
    version = "2024-03-25";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "8aad4396840be7fc42896e3011751b7609ca4119";
      sha256 = "06ahw1mxjp5g1kbsdza29hyawr4blqzw3vb9d4rg2d5qmnwcbky0";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-03-26";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "3ee60deaa539360518eaab93a6c701fe9f4d82ef";
      sha256 = "1a0z8canxpr5vlnmkqpys35yar8l296gdznqlvvvf1200wai3i8v";
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
    version = "2024-02-02";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "7c5cbf0122ff2dfbb6a92f14885894f65949cc8b";
      sha256 = "177xjvghk3i889hlmzmyc8xsryrj6f69v6dk0zs3wf10m20ixr78";
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
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "1b050206e490a4146cdf25c7b38969c1711b5620";
      sha256 = "0drqxr3rg4gvsqcabmp97bnmad93031fry1dc1k0jw85ggyyc25b";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "ed8333450af0aa6b31bc550b399e410476797d08";
      sha256 = "0n3w3w8yi57r5b7zi60v05iimj4sjjxc4jxd49galkx8n6gcj1jk";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-03-23";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "580bc045c7ab3ab3ebd267774038c0d8cc19c789";
      sha256 = "1pw9pcyh4z8f6aqhzdx2m7xjax53cs4sp9pn1d4ykxc7cwqijb0c";
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
    version = "2024-04-05";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "d26b666b45e5dde23332e4bde1227677f2d92e31";
      sha256 = "0vrddldqg1045wid8s1m8lqx8199k5rg8ssls9dl1ph872j2yvds";
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
    version = "2024-03-26";
    src = fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "d19e2edc8b18d03283bd91f67310ac300ad003ce";
      sha256 = "0pp98xgdgcpykbsm56bj6w9j178xricds7hsqzwgcckf4zwknn01";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = buildVimPlugin {
    pname = "nvim-lspconfig";
    version = "2024-04-03";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "96e5711040df23583591391ce49e556b8cd248d8";
      sha256 = "0jlqjhi6x3g8w80mqbnmybh5lmf8cw0lnyywhhdkc5plpzh43j0c";
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
    version = "2024-04-03";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "32e3a9654693f513a2cbb76ba99cbc9947b1352d";
      sha256 = "1sazs3a8zzbjy6g83fm1kqah8cc3x3pihbzqplmllrw2nbc29qxk";
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
    version = "2024-02-04";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "305bf07b919ac526deb5193280379e2f8b599926";
      sha256 = "1pmzh7pz23dl6jmcify9494jwgyi2jfjkg0l95cxfrbjqghjxli8";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "ffa213532e7a921f03262004b87d93e50c5b5275";
      sha256 = "04jyirddr57g1bghxv6xm2pa51v6rqj94d49dszm5a3vj5fsrzd6";
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
    version = "2024-04-02";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "825a61bad1d60d917a7962d73cf3c683f4e0407e";
      sha256 = "07f42msrbwi6y3dcbh7xi6jv6rj0v2llsdd14rra1wi1d6vnx2wq";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-04-02";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "ce16de5665c766f39c271705b17fff06f7bcb84f";
      sha256 = "10i720fidv41421as9i2xp4d4kr69zfyvkxjhgv6h41fdi75070c";
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
    version = "2024-03-28";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "9d5ba06d6ee7418c674f498634617416d15b6239";
      sha256 = "0xpgpjaq40qf686qg0m5hhqpqahjz5wgxviyxny2i7zk4r832bqm";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-03-20";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "dbfc1c34bed415906395db8303c71039b3a3ffb4";
      sha256 = "1xbyx5fy9mp8x2yshah810zxdkm8f94ng64al2kpx8rjf7iqk28z";
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
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "f5183cea0fda26126e22e789382c208e7b1120f4";
      sha256 = "18jb36ghjmn18791m26z5pm118aj45x4icykc02i6y32l0f308cn";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-02-27";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "84a26afce16cffa7e3322cfa80a42cddf60616eb";
      sha256 = "04sapqxwj4siwv5b0zxhv5vxmc653109bkk7yn6g5bckmwkdg2dq";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-03-18";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "e462a3446505185adf063566f5007771b69027a1";
      sha256 = "1pg1sakc1lka2j9nbdy4hqfhg4gc9csbrmpbhsyxwb8p2n4zyiiq";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-02-14";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "03cff30d7e7d3ba6fdc00925f015822f79cef908";
      sha256 = "1bw4077h3cv01wnz0gv5qkdyxi8naszkgl11zi9mqb54asl69c41";
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
    version = "2024-04-04";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "fa052c20aa7cc62ce6a328c7f3bd556c93b5370e";
      sha256 = "0hia7ksh8bvjjm8j8lvmaxf52bqfbir04kkyaa39892mxgpnv5h0";
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
    version = "2024-03-31";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "c0b1d4dfc8ba6371857868ca7c4d33954cf002fd";
      sha256 = "1sqgwp835wjz0cb1j5gfdxvfml1wz9zrgj81973b4dqdqzfcqkm9";
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
