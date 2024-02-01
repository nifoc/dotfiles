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
    version = "2024-01-29";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "4f71c0c4a196ceb656c824a70792f3df3ce6bb6d";
      sha256 = "0kr8c5fgvv7ijsvk4z0c9dawqy58mg5yz9yzx0al2ljax32lfqh1";
      fetchSubmodules = false;
    };
  };
  nvim-web-devicons = buildVimPlugin {
    pname = "nvim-web-devicons";
    version = "2024-01-29";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "aaec87dbdaa776bfa0a13c8694bec9bcb7454719";
      sha256 = "14flic4j032dikb6xixqb6cavxmrm1q27p3036zw23rg91d1k03c";
      fetchSubmodules = false;
    };
  };
  wezterm-nvim = buildVimPlugin {
    pname = "wezterm.nvim";
    version = "2024-01-23";
    src = fetchFromGitHub {
      owner = "willothy";
      repo = "wezterm.nvim";
      rev = "3455f419f9fd20c01bb5cda8c0dc726b18e083cf";
      sha256 = "0zwgc22bgan66zkr5q7h053p8bacv3afka4sjwnhnjh8rvlww86p";
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
    version = "2023-11-27";
    src = fetchFromGitHub {
      owner = "gbprod";
      repo = "yanky.nvim";
      rev = "6bb9ffd3cad4c9876bda54e19d0659de28a4f84f";
      sha256 = "01pd9xgw9wh9xa4sk80g0n61ra4l9xvssqak6vv03kgrpyb1qizw";
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
    version = "2024-01-23";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "a6cb758d4b182d9f2b7e742910078d94877c1059";
      sha256 = "1v6hwh225lh7jayq7y18d8lp8n8dk7scy21f0s5jyppy1rn7yrf8";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter = buildVimPlugin {
    pname = "nvim-treesitter";
    version = "2024-02-01";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "515b00598a4786631466d5c4b7c7fd0188ae1022";
      sha256 = "025y8afn2222659pqyrmr6rjvlfw9j6j6rsli2smj1xymb3zr8s8";
      fetchSubmodules = false;
    };
  };
  vim-just = buildVimPlugin {
    pname = "vim-just";
    version = "2024-01-29";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "8c32cbdc6614d959dcae34b8887008427af35d08";
      sha256 = "1bvn5p7xp8nxl661px9fkbszynvbb60vbvdnlwpgh0gjm3sj1l8r";
      fetchSubmodules = false;
    };
  };
  rainbow-delimiters-nvim = buildVimPlugin {
    pname = "rainbow-delimiters.nvim";
    version = "2024-01-31";
    src = fetchFromGitHub {
      owner = "HiPhish";
      repo = "rainbow-delimiters.nvim";
      rev = "ca8d5ee2b4ee1eec491040a7601d366ddc8a2e02";
      sha256 = "1jwqya4svr7xf5sim0l650a733bfsm648ic45sw90g4bih5iin0n";
      fetchSubmodules = false;
    };
  };
  todo-comments-nvim = buildVimPlugin {
    pname = "todo-comments.nvim";
    version = "2024-01-21";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "833d8dd8b07eeda37a09e99460f72a02616935cb";
      sha256 = "088b3aabv5k6bvmhwsg9v7njgz95dvvklpjab832dvpifmws4b0f";
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
    version = "2024-02-01";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "7b5c5f56a21e82fdcfe5b250278b8dfc4b1cbab4";
      sha256 = "0yfavqaiq5dwzb7jyxnjg34r0mya4r53y4jhqqdx48lkx7a9p94i";
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
    version = "2024-01-31";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "1759ea68fbbb1303192020d3e59936189359e0ed";
      sha256 = "025kamvrx8j362kszkqa028xm4d2gjxsb45rwzcp0jvx2ay74zxj";
      fetchSubmodules = false;
    };
  };
  nvim-jdtls = buildVimPlugin {
    pname = "nvim-jdtls";
    version = "2024-01-31";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-jdtls";
      rev = "4f4de4d80e1df43d58e5e21677fca4c63676664d";
      sha256 = "1n66wwqj2chm9yyqq1fksbhrdqln604sbycakfj4gf68iqi48w5a";
      fetchSubmodules = false;
    };
  };
  schemastore-nvim = buildVimPlugin {
    pname = "schemastore.nvim";
    version = "2024-01-31";
    src = fetchFromGitHub {
      owner = "b0o";
      repo = "schemastore.nvim";
      rev = "273cd742bf86aedc21c1154a2bcea044071f48d6";
      sha256 = "0gwf1gvggg3w6qs0z6gqz4ax3b3a3anl25g3p68ji53s14dfi25p";
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
    version = "2024-01-26";
    src = fetchFromGitHub {
      owner = "RRethy";
      repo = "vim-illuminate";
      rev = "97c1265ff0b67064b6cfdc15bafc50202a537ae2";
      sha256 = "1lx67qjzdcz6nslkr52xprsvb01b62wn7x965a2kkklgzwb6xjzj";
      fetchSubmodules = false;
    };
  };
  nvim-lint = buildVimPlugin {
    pname = "nvim-lint";
    version = "2024-01-24";
    src = fetchFromGitHub {
      owner = "mfussenegger";
      repo = "nvim-lint";
      rev = "8e5920f9ce9f24c283a2e64be5fe58d1d37d1744";
      sha256 = "07vs24r8jglq9sjj5lz5k2ay0b5arg21cvvl54j2hl9nrl5fl2z4";
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
    version = "2024-01-17";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "2dbef19461198630b3d7c39f414d09fb07d1fdd2";
      sha256 = "13xasp5ib9vjjis4gc239cffbb96d9dhkbpcr1wnp88i65lchp2f";
      fetchSubmodules = false;
    };
  };
  nvim-cmp = buildVimPlugin {
    pname = "nvim-cmp";
    version = "2023-12-14";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "538e37ba87284942c1d76ed38dd497e54e65b891";
      sha256 = "1mxigpm4h8ad8hjd8zy6ajkk2c03vgcrigqarhybz6zsi52iil06";
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
    version = "2024-01-29";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "4588008a7c5b57fbff97fdfb529c059235cdc7ee";
      sha256 = "0bjkzbiljfh6i4nz060cpy1akwcakn5z91xfd30yzfhs72pvqzky";
      fetchSubmodules = false;
    };
  };
  nvim-autopairs = buildVimPlugin {
    pname = "nvim-autopairs";
    version = "2024-01-22";
    src = fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "096d0baecc34f6c5d8a6dd25851e9d5ad338209b";
      sha256 = "167a5d8rycg703f1x9q7g9bavchfv8cj3qxvq721cf9sz1jniip2";
      fetchSubmodules = false;
    };
  };
  vim-matchup = buildVimPlugin {
    pname = "vim-matchup";
    version = "2024-01-06";
    src = fetchFromGitHub {
      owner = "andymass";
      repo = "vim-matchup";
      rev = "e2cca1747ab175b8d839a5d28679427564643a57";
      sha256 = "1clcvb6r1vfkajj9jd8hmvi1vx0vclyppj2vh7sjy9mpbn9xpggg";
      fetchSubmodules = false;
    };
  };
  nvim-treesitter-textobjects = buildVimPlugin {
    pname = "nvim-treesitter-textobjects";
    version = "2024-01-14";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "19a91a38b02c1c28c14e0ba468d20ae1423c39b2";
      sha256 = "1g38yh7434sxbi270q8bddqiv61msaf4cj62ar0khjavzgxy41nc";
      fetchSubmodules = false;
    };
  };
  nvim-surround = buildVimPlugin {
    pname = "nvim-surround";
    version = "2024-01-17";
    src = fetchFromGitHub {
      owner = "kylechui";
      repo = "nvim-surround";
      rev = "0c02c52182a9c2a7fa7e122b4037f6408e98434a";
      sha256 = "00cfnnz9hrr2hjvb6y58xwv6rsh0p6v7dw0ca60gx2313js10q08";
      fetchSubmodules = false;
    };
  };
  oil-nvim = buildVimPlugin {
    pname = "oil.nvim";
    version = "2024-01-22";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "bf753c3e3f8736939ad5597f92329dfe7b1df4f5";
      sha256 = "02wjsfhhq8lrai18m3khv7sln070cmwgr7jqp537dwl47v4pq4z3";
      fetchSubmodules = false;
    };
  };
  heirline-nvim = buildVimPlugin {
    pname = "heirline.nvim";
    version = "2024-01-12";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "1b6f12e011f225a26aa162905cbf68804479e7e6";
      sha256 = "0kqrriz5c0l5ljmz7amdhg3zrnkx0lpfjdxdagpcp9zyarvgdc6q";
      fetchSubmodules = false;
    };
  };
  indent-blankline-nvim = buildVimPlugin {
    pname = "indent-blankline.nvim";
    version = "2024-01-12";
    src = fetchFromGitHub {
      owner = "lukas-reineke";
      repo = "indent-blankline.nvim";
      rev = "12e92044d313c54c438bd786d11684c88f6f78cd";
      sha256 = "0mrlq0ymxg80nr9ph4gk4ldf6xmd4pxarpybb779xy7x417mnjsg";
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
    version = "2024-01-27";
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "2c2463dbd82eddd7dbab881c3a62cfbfbe3c67ae";
      sha256 = "0j9q39pks1lvp9zd97lc1frb2fq0irjizza34kp381gg6smxmc28";
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
    version = "2024-01-22";
    src = fetchFromGitHub {
      owner = "NeogitOrg";
      repo = "neogit";
      rev = "ce0c369ccdba3f644a3b28f4c053421f435352c9";
      sha256 = "0zvs6ygghz786fs436pladaml57mfb28lfx0xciwdrxfcd25rmf0";
      fetchSubmodules = false;
    };
  };
  fidget-nvim = buildVimPlugin {
    pname = "fidget.nvim";
    version = "2024-01-27";
    src = fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "1d1042d418ee8cb70d68f1e38db639844331c093";
      sha256 = "1n2hjq1yrdhx4pwf9vs0ymxlq5i10hkl7i2x3nkb6qiklrmfhmd4";
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
