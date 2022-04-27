# This file has been auto-generated
{ pkgs, ... }:
{
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-03-31";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "2337df7d778e17a58d8709f651653b9039946d8d";
      sha256 = "06gz1qsdqil1f2wsfyslk8vsdxxjjrsak0gfar2298ardaqb3dhp";
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
    version = "2022-04-17";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "9069d14a120cadb4f6825f76821533f2babcab92";
      sha256 = "0pgzi0brqn4kcbv1k5d50xm0bcwaq50sk5jnj3q9ls2pvv7lb9a0";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-04-22";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "0155028360e3072fd4f49b58a0d35c6b45c9e64f";
      sha256 = "11gi69allx6v3c5szv3s98ism8xkir0p4dzpx0wmwyhl5bkafp36";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2022-03-17";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "b46773268e66ecd371d0b32f17f7a85242475649";
      sha256 = "0xsbpq6353xhgr0967jnc1ynp1ncmq2l5jbr2p4vldbiv1agr33v";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2022-04-06";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "66379e99812ce5f46aa4810c05460c87b7b40aac";
      sha256 = "1j85rxj8cb7jxdaw3jwjgg46wsic28304b2bm2wrfj0idnmlrwki";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-04-26";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "dc1dc740fbf0d685749540392c029ddf6179b30d";
      sha256 = "1gadp3jxzh7msm1q4imkww67aa5911s9m0fv3bz5p5i9nvwq6mpm";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-01-27";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a219971291c56bcca3827cb7bd40aaaef23feeca";
      sha256 = "1n8maj50szb49qhimsx3rg4hkqspk1gqhpzg2i8fnxm1218n2mdg";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "9fdd6765fc05632c2f3af1ad825dc4e9cc0b041f";
      sha256 = "17q63fm7sg4rbp9d0njg686nkxxms3714l5aqq1mday0fjrjv15r";
      fetchSubmodules = false;
    };
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-04-24";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "a7767e2a1761078abb97f6516e45c56147e0952e";
      sha256 = "0ms95gxvydzf078y8mp2xqinm9bbk750nqc3ayyi26ipqba6f13x";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2022-04-08";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "13e2d2d63ce7bc5d875e8bdf89cb070bc8cc7a00";
      sha256 = "1klkg3n3rymb6b9im7hq9yq26mqf2v79snsqbx72am649c6qc0ns";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "4449f709c36503e65e40d9e61bf742ef861c7269";
      sha256 = "19mh83jard7g8gdmz302ar55sh7jj3mc4gmlr4bqig89l1zisk7w";
      fetchSubmodules = false;
    };
  };
  telescope-zf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-zf-native.nvim";
    version = "2022-03-15";
    src = pkgs.fetchFromGitHub {
      owner = "natecraddock";
      repo = "telescope-zf-native.nvim";
      rev = "3f64df2cb1e8c4a399154b21dabb2734a1afb8f1";
      sha256 = "11fmsalkx4hx0vd28q0hvw6jcvnb8qd7f0y69f7rlbd2n0mh9vx4";
      fetchSubmodules = true;
    };
    nativeBuildInputs = with pkgs; [ just zigpkgs."0.9.1" ];
    buildPhase = ''
      just clean
      XDG_CACHE_HOME=./xdg_cache just build
      mv lib/libzf.so lib/libzf-osx-arm64.so
      rm -rf ./xdg_cache
    '';
  };
  telescope-ui-select-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-ui-select.nvim";
    version = "2022-04-24";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "78cda7ed94663416f401ca114bde124f178cec05";
      sha256 = "1gd1qg4b3pr4vxhrvfdmghpjfn7i7jscp7gih16jmblhmc6dc44i";
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
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "86df1c83ec69e5bbcde48de74c440b71a629b2f6";
      sha256 = "1ikw17j4zwrck0xyfka9466kh3z4xcir6ixpz0snxkb7x4cnifjm";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "d754a5f062ca62bc8c3e7ecee7d514ba1dfc4b23";
      sha256 = "1bvqwigcdapl7rzmjacaghjmlwa3j29i4pxvhbdp9accc3myyc5i";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "0e9139119d3ca4b858ad7c181c72a97932699b9c";
      sha256 = "1ir6gdl7i7snpm71iy2s81pw1lgp1dbh225knm2n8qxx0szlvrny";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-04-21";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "433af3dffce64cbd3f99bdac9734768a6cc41951";
      sha256 = "0r3va6syk6vfhs909p4r5p4h3ifyy5f4rk0m9jnvwblg9cjy17sw";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2022-01-15";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "ebdfc204afb87f15ce3d3d3f5df0b8181443b5ba";
      sha256 = "0kmaxxdxlp1s5w36khnw0sdrbv1lr3p5n9r90h6h7wv842n4mnca";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2022-03-29";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "8014f6d120f72fe0a135025c4d41e3fe41fd411b";
      sha256 = "1k61aw9mp012h625jqrf311vnsm2rg27k08lxa4nv8kp6nk7il29";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-04-01";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "b10829736542e7cc9291e60bab134df1273165c9";
      sha256 = "1qygdas99m7py98rqxyza88lmk2as8yi9khjac603x6anxmq766l";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lua";
    version = "2021-10-11";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lua";
      rev = "d276254e7198ab7d00f117e88e223b4bd8c02d21";
      sha256 = "11mhpb2jdc7zq7yiwzkks844b7alrdd08h96r6y7p3cxjv1iy5gz";
      fetchSubmodules = false;
    };
  };
  cmp-path = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-path";
    version = "2022-02-02";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-path";
      rev = "466b6b8270f7ba89abd59f402c73f63c7331ff6e";
      sha256 = "15ksxnwxssv1yr1ss66mbl5w0layq0f4baisd9ki192alnkd7365";
      fetchSubmodules = false;
    };
  };
  cmp-buffer = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-buffer";
    version = "2022-02-21";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-buffer";
      rev = "d66c4c2d376e5be99db68d2362cd94d250987525";
      sha256 = "0n9mqrf4rzj784zhshxr2wqyhm99d9mzalxqnik7srkghjvc9l4a";
      fetchSubmodules = false;
    };
  };
  cmp-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-treesitter";
    version = "2022-04-25";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "c5187c31abd081ecef8b41e5eb476b7340442310";
      sha256 = "1jhzw7myrwqgybvkm53mk8zgfz56pzr7cnsrzcr4fl6wnm59a3b5";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2022-04-26";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "a4ce23892e298c1798d9213d0bc901ecbc4313e6";
      sha256 = "0g9idqmgq8n3qfg7ziaff1sw5813wf3gd5lwaigib522byaibr0d";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-document-symbol = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-document-symbol";
    version = "2022-03-22";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "c3f0086ed9882e52e0ae38dd5afa915f69054941";
      sha256 = "1jprb86z081kpxyb2dhw3n1pq15dzcc9wlwmpb6k43mqd7k8q11l";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-04-23";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "3d7b552eb4db6a3e081bf791e9e03e0dd58b7152";
      sha256 = "1w7pik465dlwpfv5nw2yg2y7g8j06rxvqg2w2cdax7d1h75jgmiv";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2022-04-22";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "044a05c4c51051326900a53ba98fddacd15fea22";
      sha256 = "0c94vnhl216p36x19cplhypr1b3z0f7l5jdr19hl79qvdfp9djk2";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-04-21";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "094e8ad3cc839e825f8dcc91352837653e365a8f";
      sha256 = "1i7d8yxqffv6rp6n66wqyb0bsrq916qlp88rn8bb92ykyxmjn8bz";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2022-04-21";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "1cb069f2a526682b3ce69610cf7c05511295ad37";
      sha256 = "09xwkzipsqiyglmyxkz0n6jycwp918mfxazqycy54zwng1c207q1";
      fetchSubmodules = false;
    };
  };
  lualine-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lualine.nvim";
    version = "2022-04-24";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "de2c4beaf50552647273b5eaa33095e90a6d00a0";
      sha256 = "0whcwy5xmkmmj7lb4w9g31rm6clx1pcnng3q22hcwyvrlxbkk263";
      fetchSubmodules = false;
    };
  };
  bufferline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "bufferline.nvim";
    version = "2022-04-20";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "f02e19bd29a27944e6bcc1e7a492fe07534b6630";
      sha256 = "10gwj4kd7kngcrfgm4jja08ss5hza7s1bzs11fjk08y489mhracp";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-04-15";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "045d9582094b27f5ae04d8b635c6da8e97e53f1d";
      sha256 = "0wxkvx1xy7p4872fh9ydsnnqlpwm9x3afwakgxv38l9vmk5mpid4";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2022-02-24";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "29db24c5e94243df1f34f47bbcb4e7803204cae4";
      sha256 = "05v1pddjp9050idp0rb8fyz8gdh00r3h7py4glg3n6r0b01hwlka";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2022-04-25";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "3b637651d5f0de185a0ceac783582692e204b053";
      sha256 = "1hpm1mhj9n6fnrkr5vpl1x80xgx7f2ic5vy9ndybbsppk2l8jrp4";
      fetchSubmodules = false;
    };
  };
  neogit = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neogit";
    version = "2022-04-13";
    src = pkgs.fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "c8dd268091ffcbcb673de59c5b37ff26a2eb24ed";
      sha256 = "0a5y5vlpfmx113byas8y91s0ng6xnxmjpva0jiv9wk419kgnk0f1";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "5f1f0c9afd2f7293cb8f4a6f4b296ed9544f0a1b";
      sha256 = "1bkq94a3k6j66v6156a6ym0vml85ma1zbdfvx9bf9bd6m6sjs35r";
      fetchSubmodules = false;
    };
  };
  spellsitter-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "spellsitter.nvim";
    version = "2022-03-29";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "spellsitter.nvim";
      rev = "f84e7a31c516f2a9cb857a02e4b551b009a81afb";
      sha256 = "10f76mk8k5rj30fiq136dpwmwbf0ha8cbxs9rg6miikgv01r734m";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-04-27";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "6f298f219f373b657b40dab7468bbd19e9ba8159";
      sha256 = "122qrzfrj9sqhjz34gxrwvmslkq050h9f6dxalkwvbvnyvhmvf17";
      fetchSubmodules = false;
    };
  };
  nvim-visual-eof-lua = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-visual-eof.lua";
    version = "2021-03-14";
    src = pkgs.fetchFromGitHub {
      owner = "LumaKernel";
      repo = "nvim-visual-eof.lua";
      rev = "3c001c6cda4db5bf62ba33344e61e30230acd9eb";
      sha256 = "0mm4zadcl9fkqwxb8kvzfspach2vxxpr3kzgnb3z3ry6zl5gcd3b";
      fetchSubmodules = false;
    };
  };
}
