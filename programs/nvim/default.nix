{ pkgs, ... }:

let
  customPlugins = import ./plugins.nix { inherit pkgs; };
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    withNodeJs = false;
    withRuby = false;
    withPython3 = false;

    extraConfig = ''
      lua require('nix_init')
    '';

    extraPackages = with pkgs; [
      nodejs-16_x
      tree-sitter

      # LSP
      efm-langserver
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      rnix-lsp
      sqls
      taplo-lsp

      # LSP Tools
      hadolint
      shellcheck
      shfmt
    ];

    plugins = with customPlugins; [
      # Fixes
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
      telescope-fzf-native-nvim
      project-nvim
      todo-comments-nvim

      # LSP
      nvim-lspconfig
      trouble-nvim
      lspkind-nvim
      lsp-status-nvim
      vim-illuminate

      # cmp
      nvim-cmp
      cmp-nvim-lsp
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
}
