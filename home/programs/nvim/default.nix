{ pkgs, config, lib, ... }:

let
  customPlugins = import ./plugins.nix { inherit pkgs; };

  nvim-spell-directory = "${config.xdg.configHome}/nvim/spell";
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;

    withNodeJs = false;
    withRuby = false;
    withPython3 = false;

    extraLuaPackages = _: [ pkgs.luarocks-jsregexp ];

    extraPackages = with pkgs; [
      git
      nodejs
      tree-sitter
      fd
      ripgrep

      # LSP
      fennel-ls
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      rnix-lsp
      sqls
      lua-language-server
      taplo-lsp

      # Diagnostic Tools
      checkstyle
      deadnix
      hadolint
      lua51Packages.fennel
      fnlfmt
      shellcheck
      shfmt
      statix
      yamllint
    ];

    extraLuaConfig =
      let
        treesitter-parsers = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
            p.bash
            p.comment
            p.css
            p.dockerfile
            p.elixir
            p.erlang
            p.fennel
            p.fish
            p.heex
            p.html
            p.http
            p.java
            p.javascript
            p.jsdoc
            p.json
            p.lua
            p.make
            p.markdown
            p.markdown-inline
            p.nix
            p.query
            p.regex
            p.ruby
            p.scss
            p.sql
            p.svelte
            p.toml
            p.tsx
            p.typescript
            p.vim
            p.yaml
          ])).dependencies;
        };
      in
      ''
        vim.opt.runtimepath:append("${treesitter-parsers}")

        require('nifoc.nix')
        require('impatient')
        require('configuration.init')
      '';

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
      {
        plugin = nvim-treesitter;
        config = builtins.readFile ../../config/nvim/plugins/treesitter.fnl;
        type = "fennel";
      }

      nvim-ts-rainbow2
      playground

      # Telescope
      {
        plugin = telescope-nvim;
        config = builtins.readFile ../../config/nvim/plugins/telescope.fnl;
        type = "fennel";
      }

      telescope-fzf-native-nvim

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
      telescope-undo-nvim

      # LSP
      {
        plugin = nvim-lspconfig;
        config = builtins.readFile ../../config/nvim/plugins/lsp.fnl;
        type = "fennel";
      }

      nvim-jdtls

      lspkind-nvim

      {
        plugin = nvim-navic;
        config = builtins.readFile ../../config/nvim/plugins/navic.fnl;
        type = "fennel";
      }

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
      # cmp-nvim-lsp-signature-help
      cmp_luasnip
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
        plugin = gitsigns-nvim;
        config = builtins.readFile ../../config/nvim/plugins/gitsigns.fnl;
        type = "fennel";
      }

      nvim-notify
      nui-nvim

      {
        plugin = noice-nvim;
        config = builtins.readFile ../../config/nvim/plugins/noice.fnl;
        type = "fennel";
      }
    ]);
  };

  xdg.configFile."nvim" = {
    source = pkgs.runCommand "nvim-fennel-files"
      {
        nativeBuildInputs = with pkgs; [ lua51Packages.fennel stylua ];
      } ''
      mkdir -p $out/lua/configuration
      mkdir -p $out/lua/nifoc/utils
      mkdir -p $out/ftplugin
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

      # ftplugin
      ftplugin_store_path="$config_store_path/ftplugin"
      ftplugin_store_fnl="$(find "$ftplugin_store_path" -type f -name '*.fnl')"

      for fnlfile in $ftplugin_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$ftplugin_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile ..."
        $fennel "$fnlfile" > "$out/ftplugin/$file_out_path"
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
