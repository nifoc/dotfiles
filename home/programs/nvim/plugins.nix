# This file has been auto-generated
{ pkgs, ... }:
rec {
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-12-28";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "c90e273f7b8c50a02f956c24ce4804a47f18162e";
      sha256 = "1cd1l55lax3938ym0kpwz0gpzmfi8rxq8rgl3l8vhq9frlaqyn53";
      fetchSubmodules = false;
    };
  };
  popup-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "popup.nvim";
    version = "2021-11-18";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
      sha256 = "093r3cy02gfp7sphrag59n3fjhns7xdsam1ngiwhwlig3bzv7mbl";
      fetchSubmodules = false;
    };
  };
  plenary-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "plenary.nvim";
    version = "2023-02-19";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "253d34830709d690f013daf2853a9d21ad7accab";
      sha256 = "17vvl06jc5vrfrv7gljflkqykshhg84wnhbl9br4pm050ywlg4ng";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2023-03-21";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "95b1e300699be8eb6b5be1758a9d4d69fe93cc7f";
      sha256 = "1hzmp6vfz4kfj7rid2br1gi438wsy435dy76n5fqqqsw67l86iza";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2023-03-03";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "47ce7ee2396fa3ee4fb6b0e0ef14ba06f9c9bd31";
      sha256 = "0x6fxayhyabag688r142bj10lilyg13ba65d0rbk9jcx1y4702j9";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2023-03-09";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "c4c794afd762a00ca543972e5b9e34ce9aa14a87";
      sha256 = "00nnnp6axlpp8g31g7yi1hzrk9pi6kgh2fm5bgxgl1ynfks45iqi";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2023-01-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "31a2099627cd1ef8898f442ee6a58c7400111395";
      sha256 = "0dykwmx1f6ack7nl4br7vs8algmj5yz5a8v3djbk62fx6alzjrq6";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2023-03-16";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "14eea5563234424e9a732cba2e8acb2e4e1f9bb4";
      sha256 = "0ak6hp0wm969y3xyyfrl21708pxh3svdmyi1xgxwdzizdf1ilnwq";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2023-03-14";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "f74473d23ebf60957e0db3ff8172349a82e5a442";
      sha256 = "1fjc3b4czlndd1nfn5n2zwlx51xhxcxiysjipfhnbbqhpy4sqfbg";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2023-02-05";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "798274ba3c454a9aa3cd71f95a86ea55cbbbb142";
      sha256 = "156g08ab9jghi580b1k88si3bc6h72d77avlpn34dnnn5481anvh";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimPlugins.nvim-treesitter.overrideAttrs (_: {
    version = "2023-03-24";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "cb568af5393241e5dbc9c19157c5df5e9ca9af2d";
      sha256 = "08wvfkxb0vw25f0rx3y183z4j30yxr5z4s0pzm6vppspzg6ksrx2";
      fetchSubmodules = false;
    };
  });
  nvim-ts-rainbow2 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow2";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "HiPhish";
      repo = "nvim-ts-rainbow2";
      rev = "742049ef6716f59c7202644a026d8dc09fc60c52";
      sha256 = "1d5p5w3vsz9pajdz4j2wmfv5nkv4bdhp084h5lhh58z0vcj62z1m";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2023-02-17";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "4044b53c4d4fcd7a78eae20b8627f78ce7dc6f56";
      sha256 = "11h0fi469fdjck318sa4fr4d4l1r57z3phhna6kclryz4mbjmk3v";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "942fe5faef47b21241e970551eba407bc10d9547";
      sha256 = "0i9j8fm5739vqzxnpvifsyfggw7xlpf77nk22l500qpw4spksb1b";
      fetchSubmodules = false;
    };
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-fzf-native.nvim";
    version = "2023-02-05";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "580b6c48651cabb63455e97d7e131ed557b8c7e2";
      sha256 = "1yjdn4729syz80radl90f2bsh7jl73rxq5ss0yp2qjj7aj8hkhm6";
      fetchSubmodules = false;
    };
    buildPhase = ''
      make
    '';
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2023-02-27";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "1c2e9c93c7c85126c2197f5e770054f53b1926fb";
      sha256 = "1q3lqngb54gnnbzvqy02lxdrzbmk9lyd2rl4q8caj3xx0wfbxlpb";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "14e2cd9a6e5e67483a03660f08471ca9a981c4a5";
      sha256 = "1mk0adblrfjhhrngc3zvrp2f348cdvj4nx7mmpjv8vq7vpvr5b4h";
      fetchSubmodules = false;
    };
  };
  telescope-ui-select-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-ui-select.nvim";
    version = "2022-04-30";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "62ea5e58c7bbe191297b983a9e7e89420f581369";
      sha256 = "09mbi1x2r2xsbgfmmpb7113jppjmfwym4sr7nfvpc9glgqlkd4zw";
      fetchSubmodules = false;
    };
  };
  telescope-toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-toggleterm.nvim";
    version = "2022-02-10";
    src = pkgs.fetchFromSourcehut {
      owner = "~havi";
      repo = "telescope-toggleterm.nvim";
      rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
      sha256 = "04vn8807gmhahhap55xjbabarlmqf05ygwqycsfkdcbm5jpcxdnw";
      fetchSubmodules = false;
    };
  };
  telescope-undo-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-undo.nvim";
    version = "2023-02-16";
    src = pkgs.fetchFromGitHub {
      owner = "debugloop";
      repo = "telescope-undo.nvim";
      rev = "03ff45fab0c4adad4d252e25b5b194e22caf5b4f";
      sha256 = "1mik7qwz16bgbfpr5lcsrgkrjwifk1zanzmsdbj416kxhsz90fx7";
      fetchSubmodules = false;
    };
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2023-03-24";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "f1392727d8ab6472b6463e875f553ebd32665d65";
      sha256 = "0ia6lmycvg8rrjbng33iqrmx1pqgsp66il7870zv899s12aspscp";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-jdtls";
    version = "2023-03-23";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "f8fb45e05e638e5c67e884f3039abcda7abc2d2d";
      sha256 = "0pr98bmfh0jx8jbwnzidbdjpxkg2fg4i4scbyimkbpbq5isxnq7h";
      fetchSubmodules = false;
    };
  };
  lspkind-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lspkind.nvim";
    version = "2022-09-22";
    src = pkgs.fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind.nvim";
      rev = "c68b3a003483cf382428a43035079f78474cd11e";
      sha256 = "0qrfqajpbkb757vbcjz1g7v5rihsyhg1f1jxrbwg08dbxpw101av";
      fetchSubmodules = false;
    };
  };
  nvim-navic = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-navic";
    version = "2023-03-24";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "bef1eb33111e177cc765c3e97f563a6313320408";
      sha256 = "0pschzv8bw6wqls530vbw8m7s3rjxc9w1vqbapprd2c9ai231993";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "a2907275a6899c570d16e95b9db5fd921c167502";
      sha256 = "1i2s3d9c0c31pv0y0iljqk2s3qcqanjw84w81ww2dnnh31qgglpi";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2023-03-23";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "b16e6e424ddfb12d4b3a699c1dc41ba0f3b503da";
      sha256 = "1rr7kz8512r8svl4yadrjhn1b9pdz36p4jvflnsha7bxznmsc6bx";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2023-03-10";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "8d3aa5c22c2d45e788c7a5fe13ad77368b783c20";
      sha256 = "0qxzy4dr9cr5q59yi7mw883id51zpb3mnrv6r0aqh9flswkljllr";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "025886915e7a1442019f467e0ae2847a7cf6bf1a";
      sha256 = "0pn6r25pk0hm5zw3dnjf811b3n0hrbrf0v9mna02i8bbni6xmnlj";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "25ddcd96540a2ce41d714bd7fea2e7f75fea8ead";
      sha256 = "1j98blydm49bzla95w082qy2hd61yb0476zawflipa8awf7ja6ac";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2023-03-17";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "777450fd0ae289463a14481673e26246b5e38bf2";
      sha256 = "0a8jj0frf2rb7dwx35157kp4iaiij2ad0azicw3i11bb4qicd08a";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2023-02-06";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "0e6b2ed705ddcff9738ec4ea838141654f12eeef";
      sha256 = "0gpwwc3rhfckaava83hpl7pw4rspicblxs7hy3y57gb560ymq6hg";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2023-02-03";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1";
      sha256 = "0bkviamzpkw6yv4cyqa9pqm1g2gsvzk87v8xc4574yf86jz5hg68";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-10-28";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "18095520391186d634a0045dacaa346291096566";
      sha256 = "0b91ap1l3nph46r7b5hcn7413yj3zhrz1jmn4xqp387ng35qz537";
      fetchSubmodules = false;
    };
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "2022-10-03";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "91ff86cd9c29299a64f968ebb45846c485725f23";
      sha256 = "18ixx14ibc7qrv32nj0ylxrx8w4ggg49l5vhcqd35hkp4n56j6mn";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "2022-08-10";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "3022dbc9166796b644a841a02de8dd1cc1d311fa";
      sha256 = "1cwx8ky74633y0bmqmvq1lqzmphadnhzmhzkddl3hpb7rgn18vkl";
      fetchSubmodules = false;
    };
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "2022-10-29";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "b40178b780d547bcf131c684bc5fd41af17d05f2";
      sha256 = "076x4rfcvy81m28dpjaqcxrl3q9mhfz7qbwgkqsyndrasibsmlzr";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2023-02-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "8fcc934a52af96120fe26358985c10c035984b53";
      sha256 = "1bhhna3f1xzf6y7q6iq9v2369w0jrgnh0hngnw84wh79pknqsgb3";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2022-10-24";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "069a207be6a0327dcc62c957dbb38156b210733a";
      sha256 = "1gpw9zmx60y6zrxb7ncgmak7sgzg8j5fhd4hqx2qkkrq6qkh07d3";
      fetchSubmodules = false;
    };
  };
  neoformat = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2023-03-18";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "ae79cb838b8ed106a083370f3eb3da88ce834c69";
      sha256 = "04d85969zmklmylf3bk68wi1ivcn0icx96f7r7g49cf7xwrr2vm7";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2023-03-07";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "e755f366721bc9e189ddecd39554559045ac0a18";
      sha256 = "07r9h19q3800r93ac4qawyl745mppp3035j9xffmx2igj5zvjmk5";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2023-03-17";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "25698e4033cd6cd3745454bfc837dd670eba0480";
      sha256 = "065j0188x7j72sz14i3i7q0vxfjbl5xz3566nybghcnqmksp9m2w";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2023-03-16";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "f69d1ac5bd3c4e6ad349f64317000cc9a4a895cf";
      sha256 = "10i9h942c9inmd2wcd3y7mmb8yn1bwc9dg5swrfl1iif6k4cmj34";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "582cbb5a4cb50f6161cac8cc01f55aeaff6d836a";
      sha256 = "11dm8vyxsy1b7c93f8gx5n6x4qf86b821myqaa09k1g761skrsvz";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "056f69ed494198ff6ea0070cfc66997cfe0a6c8b";
      sha256 = "0nkfb13jrhczw2y3wd5qr183l50wy8jk0chkiw66x4388gqnz9lm";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2023-03-23";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "ab080c47581cdecb8a5b4ec79c5c19fecb5bcd2b";
      sha256 = "06r8naxqpc4ih8xdz03jckir06mgl12zr2h8f77dnclfwpl4jvq5";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2023-02-20";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "018bd04d80c9a73d399c1061fa0c3b14a7614399";
      sha256 = "1ncpar0n8702j5h4a2bv8zx9kcg7gwfhs52qqrcg1yfsgjzb86bl";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2023-01-20";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce";
      sha256 = "02r90cqx31ja7cglfliqw0wbsm8fxh5q784wapk82zlv1p7c8ip8";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2023-03-16";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "9a595ba699837c4333c4296634feed320f084df2";
      sha256 = "154qnxarrmylnyclw4kyapi6hc98rfjymajf0a8i2ars9qkwnqzi";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2023-03-19";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "e92d99f062685f9d3ab84238e1cdde6399dc64ce";
      sha256 = "0ahs5sgs95wkpr11s93r08w0xagiqrfw5zrgqyhhjqg2dfpqzxp9";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "ca473e28382f1524aa3d2b6f04bcf54f2e6a64cb";
      sha256 = "0vczni4xa71anp948fs3lbcw9yniypbirp668j0yiminlkfi7j1i";
      fetchSubmodules = false;
    };
  };
  nui-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nui.nvim";
    version = "2023-02-28";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "0dc148c6ec06577fcf06cbab3b7dac96d48ba6be";
      sha256 = "0gwbfrwki6mm6w5lvzh7g154m1g4c2kajbbhb0i37492kwc4syn4";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2023-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "50d037041ada0895aeba4c0215cde6d11b7729c4";
      sha256 = "0nzqj6j9j0cvi0mckqggfgyc8a6cdyr6z2qwkzk30yqjs39fnh66";
      fetchSubmodules = false;
    };
  };
  noice-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "noice.nvim";
    version = "2023-03-24";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "a26fca0f623d095dfac5f97a436f97efb90772df";
      sha256 = "189d4apwca3s30332vb7wwy9f26w2jrclibgrrcfwdvk8v9kgrn2";
      fetchSubmodules = false;
    };
  };
}
