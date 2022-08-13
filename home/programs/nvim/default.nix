{ pkgs, config, lib, ... }:

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

    extraLuaPackages = with pkgs; [ luarocks-jsregexp ];

    extraPackages = with pkgs; [
      git
      nodejs
      tree-sitter
      fd
      ripgrep

      # LSP
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      rnix-lsp
      sqls
      sumneko-lua-language-server
      taplo-lsp

      # Diagnostic Tools
      deadnix
      hadolint
      fennel-luajit
      fnlfmt
      shellcheck
      shfmt
      statix
      vale
    ];

    plugins = (with customPlugins; [
      # Fixes
      impatient-nvim

      # Utils
      popup-nvim
      plenary-nvim
      nvim-web-devicons

      # Keybindings
      {
        plugin = nvim-osc52;
        config = builtins.readFile ../../config/nvim/plugins/osc52.fnl;
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
      nvim-ts-rainbow
      playground

      # Telescope
      {
        plugin = telescope-nvim;
        config = builtins.readFile ../../config/nvim/plugins/telescope.fnl;
        type = "fennel";
      }

      telescope-zf-native-nvim

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

      telescope-ui-select-nvim
      telescope-toggleterm-nvim

      # LSP
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ../../config/nvim/plugins/lsp.fnl;
        type = "fennel";
      }

      lspkind-nvim

      {
        plugin = vim-illuminate;
        config = builtins.readFile ../../config/nvim/plugins/illuminate.fnl;
        type = "fennel";
      }

      # Linter
      {
        plugin = nvim-lint;
        config = builtins.readFile ../../config/nvim/plugins/nvim-lint.fnl;
        type = "fennel";
      }

      # Comments
      {
        plugin = comment-nvim;
        config = builtins.readFile ../../config/nvim/plugins/comment.fnl;
        type = "fennel";
      }

      # Snippets
      {
        plugin = LuaSnip;
        config = builtins.readFile ../../config/nvim/plugins/luasnip.fnl;
        type = "fennel";
      }

      friendly-snippets

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

      # Formatting
      {
        plugin = neoformat;
        config = builtins.readFile ../../config/nvim/plugins/neoformat.fnl;
        type = "fennel";
      }

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

      {
        plugin = nvim-surround;
        config = builtins.readFile ../../config/nvim/plugins/surround.fnl;
        type = "fennel";
      }

      # UI
      {
        plugin = heirline-nvim;
        config = builtins.readFile ../../config/nvim/plugins/heirline.fnl;
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
        plugin = toggleterm-nvim;
        config = builtins.readFile ../../config/nvim/plugins/toggleterm.fnl;
        type = "fennel";
      }

      {
        plugin = urlview-nvim;
        config = builtins.readFile ../../config/nvim/plugins/urlview.fnl;
        type = "fennel";
      }

      {
        plugin = diffview-nvim;
        config = builtins.readFile ../../config/nvim/plugins/diffview.fnl;
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
        config = builtins.readFile ../../config/nvim/plugins/notify.fnl;
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

      # Syntax
      {
        plugin = nvim-treesitter.withPlugins (
          plugins: with plugins; [
            tree-sitter-bash
            tree-sitter-comment
            tree-sitter-css
            tree-sitter-dockerfile
            tree-sitter-elixir
            tree-sitter-erlang
            tree-sitter-fennel
            tree-sitter-fish
            tree-sitter-heex
            tree-sitter-html
            tree-sitter-http
            tree-sitter-javascript
            tree-sitter-jsdoc
            tree-sitter-json
            tree-sitter-lua
            tree-sitter-make
            tree-sitter-nix
            tree-sitter-query
            tree-sitter-regex
            tree-sitter-ruby
            tree-sitter-scss
            tree-sitter-svelte
            tree-sitter-toml
            tree-sitter-tsx
            tree-sitter-typescript
            tree-sitter-vim
            tree-sitter-yaml
          ]
        );
        config = builtins.readFile ../../config/nvim/plugins/treesitter.fnl;
        type = "fennel";
      }

      # UI
      undotree
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

      config_store_path="${../../config/nvim}"
      fennel="fennel --use-bit-lib --compile"

      echo "Using fennel command: $fennel"

      # Change PWD to config directory
      cd "$config_store_path"

      # Init
      echo "Compiling init.fnl ..."
      $fennel "$config_store_path/init.fnl" > "$out/lua/configuration/init.lua"

      # Utils
      nifoc_store_path="$config_store_path/nifoc"
      nifoc_store_fnl="$(find "$nifoc_store_path" -type f -name '*.fnl')"

      for fnlfile in $nifoc_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$nifoc_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile ..."
        $fennel "$fnlfile" > "$out/lua/nifoc/$file_out_path"
      done

      # After
      after_store_path="$config_store_path/after"
      after_store_fnl="$(find "$after_store_path" -type f -name '*.fnl')"

      for fnlfile in $after_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$after_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile ..."
        $fennel "$fnlfile" > "$out/after/$file_out_path"
      done

      # Plugins
      echo "Compiling plugin configuration ..."
      {
      cat <<EOF
      ${config.programs.neovim.generatedConfigs.fennel}
      nil
      EOF
      } | $fennel - > "$out/lua/configuration/plugins.lua"

      # Other
      echo "Copying tree-sitter queries ..."
      cp -r "$after_store_path/queries" "$out/after/"

      stylua "$out/"
    '';
    recursive = true;
  };

  home = {
    activation.neovimActivation = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      echo -n 'Removing luacache files: '
      $DRY_RUN_CMD rm -f $HOME/.cache/nvim/luacache*
      echo 'Done'
    '';

    sessionVariables.EDITOR = "nvim";

    file = {
      "${nvim-spell-directory}/de.utf-8.spl".source = builtins.fetchurl {
        url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.spl";
        sha256 = "73c7107ea339856cdbe921deb92a45939c4de6eb9c07261da1b9dd19f683a3d1";
      };

      "${nvim-spell-directory}/de.utf-8.sug".source = builtins.fetchurl {
        url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.sug";
        sha256 = "13d0ecf92863d89ef60cd4a8a5eb2a5a13a0e8f9ba8d1c6abe47aba85714a948";
      };
    };
  };
}
