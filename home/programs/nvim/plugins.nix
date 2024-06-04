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
    version = "2024-05-25";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "b77921fdc44833c994fdb389d658ccbce5490c16";
      sha256 = "1zn4qn6xz0pn3wcxd1x4j1cw7h41qkvw02qjmil71sjrsnffqrky";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-06-01";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "f73bba23ab4becd146fa2d0a3a16a84b987eeaca";
      sha256 = "0dl6nmmkkdrwl982m1ji7cw2mkln2c4iiwrg06gs0v3sx9qkkqqm";
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
    version = "2024-05-28";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "79338563e85a868e59cda02c51b54d90a5514a12";
      sha256 = "1m99c6gq0nxjdywx6q741v788rppagr2jgqqaaz9sdjd1a12pj47";
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
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "substitute.nvim";
      rev = "8b93e792747520b6490237b5b32963e256fbde24";
      sha256 = "1ndi6s8w5kyyzk9cjk7vq70sg3cnmgi2inpm2gfnhmv8yqy8rqbg";
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
    version = "2024-06-02";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "a80fe081b4c5890980561e0de2458f64aaffbfc7";
      sha256 = "06zl18d83s11x03ml6wv176pm9vrj8i1hggkq2pxv0b26pv4hg39";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-05-31";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "0f314613125fdd7c85faaee3c87051611d883253";
      sha256 = "09dmm69cw8gdwd03yk7vk35v1a17fzsvbpny1g2479ds8sagbbdn";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-06-02";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "70a93ce66083699571adc361166504b03cc39c2b";
      sha256 = "0jkk0w503l0a092ji8v23dwxl4sp6578dlc0fsbb8cws8darc8pb";
      fetchSubmodules = false;
    };
  };
  telescope-nvim = buildVimPlugin {
    pname = "telescope.nvim";
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "dfa230be84a044e7f546a6c2b0a403c739732b86";
      sha256 = "1g920dv80pkwpl7cy0khzxlsazd02n59b8r2fhd6wr9wh8kzl8b8";
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
    version = "2024-06-02";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "74e14808cdb15e625449027019406e1ff6dda020";
      sha256 = "05ariqh1igl7zljwb29qmgfd7vjax58agxkjz53qpzr5rnjfp61p";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-05-30";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "ad5ab1c9246caa9e2c69a7c13d2be9901b5c02aa";
      sha256 = "1xry7nijrr9y76y29f4za6hbjbf2w52mbp90vnpx8gxvxfcsrywx";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-06-04";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "1a4958e3d30c7dba8bf7c73bd57515edfba869cf";
      sha256 = "0hxrd1mli5kppb1wxvl1kiwk2jdxzp7b15fkgjz9f570rvpxyrmn";
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
    version = "2024-06-02";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "1a3a8d047bc01f1760ae4a0f5e80f111ea222e67";
      sha256 = "0r2baccqqf30pa852pvzr46qx779d2kn7raz599kc7546ffbk4sz";
      fetchSubmodules = false;
    };
  };
  ts-comments-nvim = buildVimPlugin {
    pname = "ts-comments.nvim";
    version = "2024-05-30";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "ts-comments.nvim";
      rev = "e339090c076871069c00e488b11def49aaf4e413";
      sha256 = "049i22k75bfxc93i0i44rkyx7jpi6cllqq9szxw9mb77f47zk56m";
      fetchSubmodules = false;
    };
  };
  LuaSnip = buildVimPlugin {
    pname = "LuaSnip";
    version = "2024-06-03";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "2b6860d15aaab01d3fb90859c0ba97f20ad7bc5f";
      sha256 = "1xfpvykk9agwaqj69vnvwy9pc702sg4i41lk0zs7591v6lr7888z";
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
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-nvim-lsp-document-symbol";
      rev = "f94f7ba948e32cd302caba1c2ca3f7c697fb4fcf";
      sha256 = "0iyy37l0pc09hs610c40q5qzvg344200kvdkn0z8pjc4zk9wc6q4";
      fetchSubmodules = false;
    };
  };
  conform-nvim = buildVimPlugin {
    pname = "conform.nvim";
    version = "2024-06-03";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "88b699b595703f1ae9d9061c050e52b1fe7c33f1";
      sha256 = "1sj5bj6hpssp41za7vfkqxh47xrmslqgs7jhm8yif99mk0gk059h";
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
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "1535a769d5dca851fe7d41b0be95f7c7203a4bef";
      sha256 = "0vw4fwyzkhg0fqavp90mq5smh95qcksjbld7cfpyrzqcj678h3fk";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-06-01";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "fd41b7ccc5490a3a99c734d1ee418b68d06c48a9";
      sha256 = "1s3282fzl28hfbhqlcc392cidnsjxr0a50rb9qlci4bl0r9jglgc";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-05-30";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "f1f0699a1d49f28e607ffa4361f1bbe757ac5ebc";
      sha256 = "0vgl1fkhvy7dkvvay3s8pcwj2j2dmajqcil0nrzyibaki1qncvf2";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-06-03";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "bbc0e67eebc15342e73b146a50d9b52e6148161b";
      sha256 = "15k0xwlq8yklvys4zr10h036s3nbfi00vn46j66mfjrzvj59r1vj";
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
    version = "2024-05-23";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "d98f537c3492e87b6dc6c2e3f66ac517528f406f";
      sha256 = "0zb52msar7hl38xmi3pvjsynjabqyv2rsajrzdx46wqp018v971b";
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
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "75dc649106827183547d3bedd4602442340d2f7f";
      sha256 = "1547d9zgfx0d7l1jdk7d9l6rcpimla083dk4f1rzi05710vipj7n";
      fetchSubmodules = false;
    };
  };
  diffview-nvim = buildVimPlugin {
    pname = "diffview.nvim";
    version = "2024-05-29";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "3afa6a053f680e9f1329c4a151db988a482306cd";
      sha256 = "0ws7zn0y54lg8sq66lfrc1ay92xxvxnr283f3dbzrvw77kdz0bph";
      fetchSubmodules = false;
    };
  };
  neogit = buildVimPlugin {
    pname = "neogit";
    version = "2024-06-02";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "3d58bf1d548f6fafdaab8ce4d75e25c438aee92c";
      sha256 = "049xhpmjwvwsmx86iq5i61dl6kp1mfha8j9dx0h1bnjy0465v1r9";
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
    version = "2024-05-31";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "which-key.nvim";
      rev = "4b7167f8fb2dba3d01980735e3509e172c024c29";
      sha256 = "0wv4lj7rpkc80w3sghhk817pm49pc6g9b1b7i0j67nvsdp83fdgf";
      fetchSubmodules = false;
    };
  };
}
