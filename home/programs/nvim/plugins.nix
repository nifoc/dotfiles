# This file has been auto-generated
{ pkgs, ... }:
rec {
  impatient-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "impatient.nvim";
    version = "2022-08-19";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "impatient.nvim";
      rev = "b842e16ecc1a700f62adb9802f8355b99b52a5a6";
      sha256 = "1q4ym3n98l3njs8qhiabvxc576xr7a5riykfcw6mh6vjkgs26jyd";
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
    version = "2022-10-01";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "4b7e52044bbb84242158d977a50c4cbcd85070c7";
      sha256 = "11815h0h2mf5ym282ghk7xav90635r88qbgaflpgbyk2banl31wl";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-web-devicons";
    version = "2022-10-03";
    src = pkgs.fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da";
      sha256 = "1946azhr3rq702mvidzby9jvq7h2zs45d6k9j7clxw2g9xbx0k6a";
      fetchSubmodules = false;
    };
  };
  nvim-osc52 = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-osc52";
    version = "2022-09-29";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-osc52";
      rev = "87069dc586d835b70360d4771de53adb9b4aaff7";
      sha256 = "03mmfb5cyh7pm1kbl5ws1ch7r47qbj4dqiyh5dwf3c70a38ry194";
      fetchSubmodules = false;
    };
  };
  yanky-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "yanky.nvim";
    version = "2022-10-05";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "39bef9fe84af59499cdb88d8e8fb69f3175e1265";
      sha256 = "051mr4asnb3rzp0p1g6zaxyxmxljzj1v4wgyxx9h04zx0n5j10r8";
      fetchSubmodules = false;
    };
  };
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass.nvim";
    version = "2022-09-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "e607a4787ae898fe844ea678e7f5977a9358d0b1";
      sha256 = "1lsr9c8rpcihkcbwj7l0qq7715588vnsn45r3spn5nan1w6ycwqk";
      fetchSubmodules = false;
    };
  };
  substitute-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "substitute.nvim";
    version = "2022-09-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "1eb56f6494642cf72cf1868312e26ac3d86621be";
      sha256 = "1x952d1ym9636gdmwg3grcbw4cb72gxjz2xpvlwpqzv4vhi2r2li";
      fetchSubmodules = false;
    };
  };
  leap-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "leap.nvim";
    version = "2022-10-15";
    src = pkgs.fetchFromGitHub {
      owner = "ggandor";
      repo = "leap.nvim";
      rev = "a9d3232b178fddabb6660dc19abf40e05d6841b0";
      sha256 = "0ip1cylfsdcfjswg7f3lkwnxqab5x1mdhmik7krhis9c2x5harg2";
      fetchSubmodules = false;
    };
  };
  dracula-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "dracula.nvim";
    version = "2022-09-13";
    src = pkgs.fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "0b4f6e009867027caddc1f28a81d8a7da6a2b277";
      sha256 = "0hca52p33a5vaqjh0aqmqcd568wd7czkzvgprxkvwhmc9m43nlf3";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "e8ae570a429e8c7ad4f19f64b0cd8d51fd006852";
      sha256 = "1fpzl9m1mg7scljrwf8hvx2riiky05hachwm0wq5cyvhym73jxr8";
      fetchSubmodules = false;
    };
    passthru.withPlugins =
      grammarFn: nvim-treesitter.overrideAttrs (_: {
        postPatch =
          let
            grammars = pkgs.tree-sitter.withPlugins grammarFn;
          in
          ''
            rm -r parser
            ln -s ${grammars} parser
          '';
      });
  };
  nvim-ts-rainbow = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-rainbow";
    version = "2022-09-30";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "nvim-ts-rainbow";
      rev = "1ec3f880585c644ddd50a51502c59f4e36f03e62";
      sha256 = "03403mx5rdknsaia8br0ymc9y53kv8jnnlawfrwralxm1fsrml5h";
      fetchSubmodules = false;
    };
  };
  playground = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "playground";
    version = "2022-09-19";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf";
      sha256 = "01smml755a1v09pfzg3zznr4hbxil0j8vqp8wxxb89ak1dipmjy2";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope.nvim";
    version = "2022-10-09";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "f174a0367b4fc7cb17710d867e25ea792311c418";
      sha256 = "1hra6vrr25xan0xwjc76m14ml6hwrm7nx2wapl44zx3m29hwfasx";
      fetchSubmodules = false;
    };
  };
  telescope-zf-native-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-zf-native.nvim";
    version = "2022-10-05";
    src = pkgs.fetchFromGitHub {
      owner = "natecraddock";
      repo = "telescope-zf-native.nvim";
      rev = "0a8408059c6d443a33595cc021677163ed81d2c5";
      sha256 = "1yipix2v6rxj249p80c36y3rc9k1wrlv509nd38ip2p3r6ifwz4n";
      fetchSubmodules = true;
    };
    nativeBuildInputs = with pkgs; [ just zig ];
    buildPhase = ''
      just clean
      XDG_CACHE_HOME=./xdg_cache just build
      mv lib/libzf.so lib/libzf-osx-arm64.so
      rm -rf ./xdg_cache
    '';
  };
  project-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "project.nvim";
    version = "2022-09-18";
    src = pkgs.fetchFromGitHub {
      owner = "ahmedkhalf";
      repo = "project.nvim";
      rev = "628de7e433dd503e782831fe150bb750e56e55d6";
      sha256 = "0p7j5hh45rdricrryy87m7p26wdg6fs07gbyjhrvzxvbsmfbzn9s";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "todo-comments.nvim";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "61240662fd9ffa4a546db57abcc50b97f6fab27b";
      sha256 = "0a2wzkahq3dm6yszrl3arl0p6yd6ymi5kqhzdcgkk4vb7j0ff9k4";
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
  nvim-lspconfig = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lspconfig";
    version = "2022-10-15";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "35a731bddaf20be0a2a0492cfa489ae6130a4eb6";
      sha256 = "0rmn31nq7mg40j2hmq585ndcfdb11r3ij1wpg3b301c209q97clg";
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
    version = "2022-09-30";
    src = pkgs.fetchFromGitHub {
      owner = "SmiteshP";
      repo = "nvim-navic";
      rev = "132b273773768b36e9ecab2138b82234a9faf5ed";
      sha256 = "1qs02qkjzq0lczc4sdds0p2rrr1klnmw7n7n3hy6i4sr6gycfg1v";
      fetchSubmodules = false;
    };
  };
  vim-illuminate = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-illuminate";
    version = "2022-10-04";
    src = pkgs.fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "0603e75fc4ecde1ee5a1b2fc8106ed6704f34d14";
      sha256 = "01361ss6g7kcap7hjma9ij8xa75zlvy878s4p7r5sxxbdwwpqarg";
      fetchSubmodules = false;
    };
  };
  nvim-lint = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-lint";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "2ad83cad2aba5ac6071d75a32f0792e9e8af1ec5";
      sha256 = "0am81inrd6hn3a58afp0mrqsz9v31nxm93dzq0mc4086qfnhvlqg";
      fetchSubmodules = false;
    };
  };
  comment-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "comment.nvim";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "numtostr";
      repo = "comment.nvim";
      rev = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6";
      sha256 = "1gy2caam9g1zhnplj6d943p62n4kqgasi4wwgq1ry7gzlm2gi5v0";
      fetchSubmodules = false;
    };
  };
  LuaSnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "LuaSnip";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "663d54482b11bca1ce94f56993b9f6ab485a13dc";
      sha256 = "1lp93qqmhj2bvgsa2dji91spdilpr8lz2kbrm7cvqdz4x418bq7y";
      fetchSubmodules = false;
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "friendly-snippets";
    version = "2022-10-12";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "fd16b4d9dc58119eeee57e9915864c4480d591fd";
      sha256 = "18fzpij4c11jvxhsjp65cmmc7nna4p3whjsx8a0a263kahh8npfp";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-cmp";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "e94d3489311f941788756953df23ca84f83eec95";
      sha256 = "1v6iw2bqaqxzspl239jw3aqj64mc9sq2xxibvll7rmxxgv2mgyb5";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp";
    version = "2022-10-15";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp";
      rev = "3cf38d9c957e95c397b66f91967758b31be4abe6";
      sha256 = "0l0cqrarrp3rj3pmjivjgh8f1cd3grrkz6pnzpwpwxj9amv6k6p2";
      fetchSubmodules = false;
    };
  };
  cmp-nvim-lsp-signature-help = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-nvim-lsp-signature-help";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-signature-help";
      rev = "d2768cb1b83de649d57d967085fe73c5e01f8fd7";
      sha256 = "13imcdv0yws084z2x2lmdj17zy4ngf126i7djknnwp2jfkca1120";
      fetchSubmodules = false;
    };
  };
  cmp_luasnip = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp_luasnip";
    version = "2022-05-01";
    src = pkgs.fetchFromGitHub {
      owner = "saadparwaiz1";
      repo = "cmp_luasnip";
      rev = "a9de941bcbda508d0a45d28ae366bb3f08db2e36";
      sha256 = "0mh7gimav9p6cgv4j43l034dknz8szsnmrz49b2ra04yk9ihk1zj";
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
    version = "2022-10-02";
    src = pkgs.fetchFromGitHub {
      owner = "ray-x";
      repo = "cmp-treesitter";
      rev = "5f695e4173ad74a4c8dbbfd8990286464bf69293";
      sha256 = "1l32k8fdmpg8lfh1qqmahash957izz9zr6gfjvfs5s4if0fl3f2r";
      fetchSubmodules = false;
    };
  };
  cmp-cmdline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cmp-cmdline";
    version = "2022-09-16";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-cmdline";
      rev = "c66c379915d68fb52ad5ad1195cdd4265a95ef1e";
      sha256 = "00ivhdq1skdccmkn0sd0kr8b9gnap84in34q5r2mkmnd07vhiwr2";
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
  neoformat = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neoformat";
    version = "2022-09-01";
    src = pkgs.fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "0ae951121da29a157d80db70c32679b428afffdc";
      sha256 = "1nslf2wfj0z4qq7zgqcx62gb31px6sqqb8rk1a10j3ply5bc7r67";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-autopairs";
    version = "2022-10-01";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "4fc96c8f3df89b6d23e5092d31c866c53a346347";
      sha256 = "09aka75d7a0acixrp2b7hfy08vdnjxxiknd5ngf2pk479k8z5zbj";
      fetchSubmodules = false;
    };
  };
  nvim-ts-autotag = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-ts-autotag";
    version = "2022-08-11";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-ts-autotag";
      rev = "fdefe46c6807441460f11f11a167a2baf8e4534b";
      sha256 = "0cwz18risvkgwr3ppc2vqs6rk94kgra4vmhswn4699fnsmha5lcn";
      fetchSubmodules = false;
    };
  };
  vim-matchup = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-matchup";
    version = "2022-10-01";
    src = pkgs.fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "3fa1b2283e957784922fe891de361a2342b90bca";
      sha256 = "0x86wmph3pb4bkqddb1zm381q9214hvf7cq9ydch4hjbx0vmbjwi";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-treesitter-textobjects";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "0750397ecd5c4b573ac46315a0be742f8580248e";
      sha256 = "07b7lm9sczmk5iazldw1kkjc17jvbr4yp19wdblqjyiv8mmdkfz7";
      fetchSubmodules = false;
    };
  };
  nvim-surround = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-surround";
    version = "2022-10-14";
    src = pkgs.fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "81f672ad6525b5d8cc27bc6ff84636cc12664485";
      sha256 = "10xrnl3aqgz85knlf8ypxcq0zk9k4rby2pcfvh0kiyc46shqcwlr";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "heirline.nvim";
    version = "2022-10-09";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "19cab76f52710ec67bd8829cbc96d0c322963090";
      sha256 = "0faiwwv4744cy08qx7z1zr33bcrbgqf0x8y0qn7zaghvch1bp4iw";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "indent-blankline.nvim";
    version = "2022-09-02";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6";
      sha256 = "1r9y6zqar0gv8kvqqxlh07ifa16h5yqa24fj22qw63vgnysbxqbp";
      fetchSubmodules = false;
    };
  };
  virt-column-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "virt-column.nvim";
    version = "2022-09-21";
    src = pkgs.fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "virt-column.nvim";
      rev = "36fa3be9cba9195081e934b4f9729021726c5889";
      sha256 = "097ki3ms89a2m2kvv3fg43dq7cfj6j62n3g58fmr945j5a7srssj";
      fetchSubmodules = false;
    };
  };
  toggleterm-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "toggleterm.nvim";
    version = "2022-09-18";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "toggleterm.nvim";
      rev = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda";
      sha256 = "01yb5i7y5lcm498pbkiyjqczh5p9kimxjgc0cw99ad8j9n23hq82";
      fetchSubmodules = false;
    };
  };
  urlview-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "urlview.nvim";
    version = "2022-10-15";
    src = pkgs.fetchFromGitHub {
      owner = "axieax";
      repo = "urlview.nvim";
      rev = "8a52703b9303e206dd8dcf9b07f510f3d3ae87d5";
      sha256 = "11cf98bbf8526x0w8mkm3096l2wk9y6zj3hwwccs1dfw9v3jfm5c";
      fetchSubmodules = false;
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "gitsigns.nvim";
    version = "2022-10-16";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "bf20b5d820a7c8d25b45fd76fe8bee25fc2c7258";
      sha256 = "0zp1b3dnys7qf3r4gdf4shbbh7y5m4i75zcgbqzlbjg367wnnw8h";
      fetchSubmodules = false;
    };
  };
  nvim-notify = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "nvim-notify";
    version = "2022-10-13";
    src = pkgs.fetchFromGitHub {
      owner = "rcarriga";
      repo = "nvim-notify";
      rev = "af935fd8329ba67d96afa1b2650af84251f1dc0a";
      sha256 = "1kj77gkbg9pmhhglbajpfzrk2py9d5bs8bwdcmbdz1kscdiah84a";
      fetchSubmodules = false;
    };
  };
}
