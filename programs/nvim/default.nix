{ config, pkgs, ... }:

let
  customPlugins = import ./plugins.nix { inherit pkgs; };

  nvim-spell-directory = "${config.xdg.configHome}/nvim/spell";
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
      let xcode_paths = [':/usr/local/bin:', ':/usr/bin:', ':/usr/sbin:', ':/bin:', ':/sbin:']
      for xcode_path in xcode_paths
        let $PATH = substitute($PATH, xcode_path, ":", "") . substitute(xcode_path, ":$", "", "")
      endfor

      lua << EOF
        require('impatient')
        require('configuration.init')
      EOF
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
      deadnix
      hadolint
      fennel-luajit
      fnlfmt
      shellcheck
      shfmt
      statix
    ];

    extraLuaPackages = with pkgs.luajitPackages; [ readline ];

    plugins = (with customPlugins; [
      # Fixes
      impatient-nvim

      # Utils
      popup-nvim
      plenary-nvim

      # Keybindings
      {
        plugin = legendary-nvim;
        config = builtins.readFile ../../config/nvim/plugins/legendary.fnl;
        type = "fennel";
      }

      {
        plugin = yanky-nvim;
        config = builtins.readFile ../../config/nvim/plugins/yanky.fnl;
        type = "fennel";
      }

      {
        plugin = cutlass-nvim;
        config = builtins.readFile ../../config/nvim/plugins/cutlass.fnl;
        type = "fennel";
      }

      {
        plugin = substitute-nvim;
        config = builtins.readFile ../../config/nvim/plugins/substitute.fnl;
        type = "fennel";
      }

      {
        plugin = leap-nvim;
        config = ''
          (let [leap (require :leap)]
            (leap.set_default_keymaps))
        '';
        type = "fennel";
      }

      # Themes
      dracula-nvim

      # Syntax
      {
        plugin = nvim-treesitter;
        config = builtins.readFile ../../config/nvim/plugins/treesitter.fnl;
        type = "fennel";
      }

      nvim-ts-rainbow
      playground

      # Telescope
      {
        plugin = telescope-nvim;
        config = builtins.readFile ../../config/nvim/plugins/telescope.fnl;
        type = "fennel";
      }

      telescope-zf-native-nvim
      telescope-ui-select-nvim

      # LSP
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ../../config/nvim/plugins/lsp.fnl;
        type = "fennel";
      }

      virtual-types-nvim

      # Linter
      {
        plugin = nvim-lint;
        config = builtins.readFile ../../config/nvim/plugins/nvim-lint.fnl;
        type = "fennel";
      }

      # Snippets
      {
        plugin = LuaSnip;
        config = builtins.readFile ../../config/nvim/plugins/luasnip.fnl;
        type = "fennel";
      }

      # cmp
      {
        plugin = nvim-cmp;
        config = builtins.readFile ../../config/nvim/plugins/cmp.fnl;
        type = "fennel";
      }

      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp_luasnip
      cmp-nvim-lua
      cmp-path
      cmp-buffer
      cmp-treesitter
      cmp-cmdline
      cmp-nvim-lsp-document-symbol

      # Pairs
      {
        plugin = nvim-autopairs;
        config = builtins.readFile ../../config/nvim/plugins/autopairs.fnl;
        type = "fennel";
      }

      {
        plugin = nvim-ts-autotag;
        config = ''
          (let [ts-autotag (require :nvim-ts-autotag)]
            (ts-autotag.setup))
        '';
        type = "fennel";
      }

      {
        plugin = vim-matchup;
        config = builtins.readFile ../../config/nvim/plugins/matchup.fnl;
        type = "fennel";
      }

      # Textobjects
      nvim-treesitter-textobjects

      # UI
      {
        plugin = lualine-nvim;
        config = builtins.readFile ../../config/nvim/plugins/lualine.fnl;
        type = "fennel";
      }

      {
        plugin = bufferline-nvim;
        config = builtins.readFile ../../config/nvim/plugins/bufferline.fnl;
        type = "fennel";
      }

      {
        plugin = indent-blankline-nvim;
        config = builtins.readFile ../../config/nvim/plugins/indent_line.fnl;
        type = "fennel";
      }

      {
        plugin = virt-column-nvim;
        config = ''
          (let [virt-column (require :virt-column)]
            (virt-column.setup))
        '';
        type = "fennel";
      }

      {
        plugin = neogit;
        config = builtins.readFile ../../config/nvim/plugins/neogit.fnl;
        type = "fennel";
      }

      {
        plugin = gitsigns-nvim;
        config = builtins.readFile ../../config/nvim/plugins/gitsigns.fnl;
        type = "fennel";
      }

      {
        plugin = spellsitter-nvim;
        config = ''
          (let [spellsitter (require :spellsitter)]
            (spellsitter.setup))
        '';
        type = "fennel";
      }

      {
        plugin = nvim-notify;
        config = "(set vim.notify (require :notify))";
        type = "fennel";
      }

      {
        plugin = nvim-visual-eof-lua;
        config = builtins.readFile ../../config/nvim/plugins/visual-eof.fnl;
        type = "fennel";
      }
    ]) ++ (with pkgs.vimPlugins; [
      # Fixes
      FixCursorHold-nvim

      # Utils
      nvim-web-devicons

      # Telescope
      {
        plugin = project-nvim;
        config = builtins.readFile ../../config/nvim/plugins/project.fnl;
        type = "fennel";
      }

      {
        plugin = todo-comments-nvim;
        config = builtins.readFile ../../config/nvim/plugins/todo-comments.fnl;
        type = "fennel";
      }

      # LSP
      lspkind-nvim
      lsp-status-nvim

      {
        plugin = vim-illuminate;
        config = builtins.readFile ../../config/nvim/plugins/illuminate.fnl;
        type = "fennel";
      }

      # Formatting
      {
        plugin = neoformat;
        config = builtins.readFile ../../config/nvim/plugins/neoformat.fnl;
        type = "fennel";
      }

      # Comments
      {
        plugin = comment-nvim;
        config = builtins.readFile ../../config/nvim/plugins/comment.fnl;
        type = "fennel";
      }

      # Snippets
      friendly-snippets

      # Textobjects
      vim-surround

      # UI
      undotree

      {
        plugin = toggleterm-nvim;
        config = builtins.readFile ../../config/nvim/plugins/toggleterm.fnl;
        type = "fennel";
      }
    ]);
  };

  xdg.configFile."nvim" = {
    source = pkgs.runCommand "nvim-fennel-files"
      {
        nativeBuildInputs = with pkgs; [ fennel-luajit stylua ];
      } ''
      mkdir -p $out/lua/configuration
      mkdir -p $out/lua/nifoc/utils
      mkdir -p $out/after/ftplugin

      fennel="fennel --use-bit-lib --compile"
      config_store_path="${../../config/nvim}"

      # Init
      $fennel "$config_store_path/init.fnl" > "$out/lua/configuration/init.lua"

      # Utils
      nifoc_store_path="$config_store_path/nifoc"
      nifoc_store_fnl="$(find "$nifoc_store_path" -type f -name '*.fnl')"

      for fnlfile in $nifoc_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$nifoc_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile ..."
        $fennel "$fnlfile" > "$out/lua/nifoc/$file_out_path"
      done

      # Plugins
      cat <<EOF >>plugins.fnl
      ${config.programs.neovim.generatedConfigs.fennel}
      nil
      EOF

      $fennel "./plugins.fnl" > "$out/lua/configuration/plugins.lua"

      # After
      after_store_path="$config_store_path/after"
      after_store_fnl="$(find "$after_store_path" -type f -name '*.fnl')"

      for fnlfile in $after_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$after_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile ..."
        $fennel "$fnlfile" > "$out/after/$file_out_path"
      done

      cp -r "$after_store_path/queries" "$out/after/"

      stylua "$out/"
    '';
    recursive = true;
  };

  home.file."${nvim-spell-directory}/de.utf-8.spl".source = builtins.fetchurl {
    url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.spl";
    sha256 = "73c7107ea339856cdbe921deb92a45939c4de6eb9c07261da1b9dd19f683a3d1";
  };

  home.file."${nvim-spell-directory}/de.utf-8.sug".source = builtins.fetchurl {
    url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.sug";
    sha256 = "13d0ecf92863d89ef60cd4a8a5eb2a5a13a0e8f9ba8d1c6abe47aba85714a948";
  };

  home.sessionVariables.EDITOR = "nvim";
}
