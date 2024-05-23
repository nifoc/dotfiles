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
    version = "2024-05-20";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683";
      sha256 = "0n2p8krzwiw682f0yb6n8faamffpp336rjy50pbqf3jmc6czd5z4";
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
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "8756d19923ad871eb95f543a8a98c026b4a8494f";
      sha256 = "05pqf5zacfzm4xgjf0clwyla2p8q2x0w9q3q9ydbv70kmyw29334";
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
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "30de5e7e9486fb1b1b8c2a1e71052b13f94f1cb0";
      sha256 = "1snqjj2x9zccvbv364qrpadwgks8g2qmlvkbf8x8lpbcrh6jamdq";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-05-21";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "5d0d30b201566ce1fe31415f41fe2a7bdf56f4a7";
      sha256 = "040pamj5q3n600wc1awx2p1mi1hadxgm5lr6qiv678a1qdrjsid6";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "e1549807066947818113a7d7ed48f637e49620d3";
      sha256 = "16ih348appcdvg7cd62232gv700z1jz1zj3khnfh98h7d9x796k4";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2024-05-23";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "5665d93988acfbb0747bdbf4f4cb583bcebc8930";
      sha256 = "0wr4012ix54p33iz9h4f9iwls15nqzs0ilh5f5ai6xg6nspy21v1";
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
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "eadcee1573ca9d0e0cd36a49f620186a8dfdc607";
      sha256 = "1vj482awz8m3jvn8d368rxbszvwj5mcjbh9j579k7qlpprjw5pv8";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-05-16";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "29255ea26dfb51ef0213f7572bff410f1afb002d";
      sha256 = "1h3hdl99mb5r8mslcp7s78abyrrjjhmkndbif8c5iah7wmfnyq2c";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "9a5992a881583d886bfbb46631a09f736f0fae50";
      sha256 = "0b3plas4wxfq0a4dv1kgwh58yki3xixwfhpggvz5a713ypriy91k";
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
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "e19842a05aae484957ad20710444757bc0a61d63";
      sha256 = "1w74a9biz4ca7fsfkyyxzkldirf7ihk2rcg53xb43wjchzgvm49g";
      fetchSubmodules = false;
    };
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "82b66eb8b72c95c6bea90a5dae30d109633008f8";
      sha256 = "00l1hi68frlfnz8a0bi4d8a37p0wscfhrf2c1l85k3mylszih9pd";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-05-18";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "de1a287c9cb525ae52bc846e8f6207e5ef1da5ac";
      sha256 = "1acqpdhnzb4rngrf4gzizkb2nv98s3n1iwizh4vwcrafcdd15cql";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2024-05-17";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "5260e5e8ecadaf13e6b82cf867a909f54e15fd07";
      sha256 = "1ld6xs2mby4kyq3c6b88hcn3mw0x2yhzmgc8xm65ap59dafxy58s";
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
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "f3b930db4964d60e255c8f9e37b7f2218dfc08cb";
      sha256 = "0xw2b1i2vn73l5381gh2vnw8jhxbazvfc158r8zmwys75byfg50b";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-05-19";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "c15de7e7981f1111642e7e53799e1211d4606cb9";
      sha256 = "0nd175qdh4fr0qjvdj7fa89lxhzdrf6ilc5r5vajzbfmbj72lh30";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2024-05-19";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "ff3bea611696f5cfdfe61a939149daadff41f2af";
      sha256 = "1v966r775wlpkh2gm1rj6g1f7c78mbi3s5i374rwbp8y8ls8grdd";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-05-23";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "3557e41418b4a6c5b85d5d64abe94c9c50fa9b14";
      sha256 = "111ywl75bpfmfrawnw2rrjlvrd2amyh6ivac0w8xlh38x5l06ncy";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-05-16";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "79aaa42da1f698ed31bcbe7f83081f69dca7ba17";
      sha256 = "040mfsmxr7yfpmfi797vzaxcfp98l897nrz2pd5a6ghpvj3b83ij";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "2cb39e838e9dcd8b374f09a3a87a2e5ec9d372f6";
      sha256 = "0m75vs3xijv2b27q6zh95jhs0fy4qpc488aqcpmjamgpp7nakhly";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-05-21";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "0d797435e54645a5f98bad7ad6046aac1ef95c1e";
      sha256 = "0payyx0j0s4wgk5xvczdnjqkj5nymlhw4f7hcw3sl9m334vnxshb";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-05-18";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "ece00d5fb44d196680a81fd2761062d2fa44663b";
      sha256 = "1hvhcj7ra61lv2aiifv0izf845y61pmzj4yahk4bkcc3y5knhlda";
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
    version = "2024-05-19";
    src = fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "9206224f6cfe62b35d5ae5610e225c6d0a6436d3";
      sha256 = "0kinddnmxh4jdirmhdvzwmnw57vjn1gc6vc9bqaak14zxdk6lc9l";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = buildVimPlugin {
    pname = "gitsigns.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "a28bb1db506df663b063cc63f44fbbda178255a7";
      sha256 = "1vvrdf29m3a8lpc3nsmi1i3hd00x8wbqjldkv849cdj95jfn29zn";
      fetchSubmodules = false;
    };
  };
  diffview-nvim = buildVimPlugin {
    pname = "diffview.nvim";
    version = "2024-05-22";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "72c6983f422689f310b379a04fd555799b0d7cfc";
      sha256 = "1wirnmf2mzxaf6f86y4b9jw3002msv6afxwc6s3adpn731mky2aa";
      fetchSubmodules = false;
    };
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-05-21";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "49b7f1043ec537007f182313537ac4ceaa08638f";
      sha256 = "0jmyx3v2bzj1wmxiwnri9r6vx53n0ldv48ik1fpf30006rfc08q4";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-05-19";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "ef99df04a1c53a453602421bc0f756997edc8289";
      sha256 = "1j0s31k8dszb0sq46c492hj27w0ag2zmxy75y8204f3j80dkz68s";
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
