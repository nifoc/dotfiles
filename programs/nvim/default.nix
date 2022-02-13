{ config, pkgs, ... }:

let
  customPlugins = import ./plugins.nix { inherit pkgs; };

  nvim-spell-directory = "${config.xdg.configHome}/nvim/spell";

  nvim-spell-de-utf8-dictionary = builtins.fetchurl {
    url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.spl";
    sha256 = "73c7107ea339856cdbe921deb92a45939c4de6eb9c07261da1b9dd19f683a3d1";
  };

  nvim-spell-de-utf8-suggestions = builtins.fetchurl {
    url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.sug";
    sha256 = "13d0ecf92863d89ef60cd4a8a5eb2a5a13a0e8f9ba8d1c6abe47aba85714a948";
  };
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    withNodeJs = false;
    withRuby = false;
    withPython3 = false;

    extraConfig = ''
      " Move these paths to the end of $PATH to prevent triggering the XCode CLI popup
      let xcode_paths = ":/usr/bin:/bin:/usr/sbin:/sbin"
      let $PATH = substitute($PATH, xcode_paths, "", "") . xcode_paths

      lua require('impatient')
      lua require('nix_init')
    '';

    extraPackages = with pkgs; [
      gcc
      gnumake
      git
      nodejs-16_x
      tree-sitter
      ripgrep

      # LSP
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      rnix-lsp
      sqls
      sumneko-lua-language-server
      taplo-lsp

      # LSP Tools
      hadolint
      shellcheck
      shfmt
      statix
    ];

    plugins = with customPlugins; [
      # Fixes
      impatient-nvim
      FixCursorHold-nvim
      vim-auto-cursorline

      # Utils
      popup-nvim
      plenary-nvim
      nvim-web-devicons

      # Keybindings
      which-key-nvim
      { plugin = vim-yoink; optional = true; }
      { plugin = vim-cutlass; optional = true; }
      { plugin = vim-subversive; optional = true; }

      # Themes
      dracula-nvim

      # Syntax
      nvim-treesitter
      playground
      Jenkinsfile-vim-syntax

      # Telescope
      telescope-nvim
      telescope-zf-native-nvim
      project-nvim
      todo-comments-nvim

      # LSP
      nvim-lspconfig
      null-ls-nvim
      trouble-nvim
      lspkind-nvim
      lsp-status-nvim
      vim-illuminate

      # cmp
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      LuaSnip
      cmp_luasnip
      cmp-nvim-lua
      cmp-path
      cmp-buffer
      cmp-treesitter
      cmp-cmdline
      cmp-nvim-lsp-document-symbol

      # Pairs
      nvim-autopairs
      nvim-ts-autotag
      vim-matchup

      # Comments
      Comment-nvim

      # Textobjects
      nvim-treesitter-textobjects
      surround-nvim

      # UI
      undotree
      lualine-nvim
      bufferline-nvim
      nvim-tree-lua
      indent-blankline-nvim
      virt-column-nvim
      nvim-colorizer-lua
      gitsigns-nvim
      spellsitter-nvim
      nvim-notify
      nvim-visual-eof-lua
      FTerm-nvim
      editorconfig-vim
    ];
  };

  xdg.configFile.nvim = {
    source = ../../config/nvim;
    recursive = true;
  };

  home.file."${nvim-spell-directory}/de.utf-8.spl".source = nvim-spell-de-utf8-dictionary;
  home.file."${nvim-spell-directory}/de.utf-8.sug".source = nvim-spell-de-utf8-suggestions;
}
