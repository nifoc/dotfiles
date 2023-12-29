{ pkgs, config, lib, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;

    withNodeJs = false;
    withRuby = false;
    withPython3 = false;

    extraLuaPackages = luaPkgs: with luaPkgs; [ jsregexp lua-toml readline ];

    extraPackages = with pkgs; [
      git
      nodejs
      tree-sitter
      fd
      ripgrep
      universal-ctags

      # LSP
      fennel-ls
      lexical
      #nil
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      nixd
      taplo-lsp

      # Diagnostic Tools
      checkstyle
      deadnix
      nodePackages.eslint_d
      hadolint
      luajitPackages.fennel
      nixpkgs-fmt
      shellcheck
      statix
    ] ++ optionals isDarwin [
      xcbuild
    ];

    extraLuaConfig =
      let
        treesitter-parsers = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
            p.angular
            p.bash
            #p.comment # slow
            p.css
            p.diff
            p.dockerfile
            p.eex
            p.elixir
            p.erlang
            p.fennel
            p.fish
            p.graphql
            p.heex
            p.html
            p.http
            p.java
            p.javascript
            p.jsdoc
            p.json
            p.kotlin
            p.lua
            p.make
            p.markdown
            p.markdown_inline
            p.nix
            p.python
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
        /* lua */ ''
        vim.loader.enable()
        vim.opt.runtimepath:prepend("${treesitter-parsers}")

        require('nifoc.nix')
        require('configuration.init')
      '';

    plugins =
      let
        customPlugins = import ./plugins.nix { inherit pkgs; };
      in
      with customPlugins; [
        # Utils
        popup-nvim
        plenary-nvim

        nvim-web-devicons

        {
          plugin = wezterm-nvim;
          config = builtins.readFile ../../config/nvim/plugins/wezterm.fnl;
          type = "fennel";
        }

        vim-cool

        # Keybindings
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

        move-nvim

        # Themes
        dracula-nvim

        # Syntax
        {
          plugin = nvim-treesitter;
          config = builtins.readFile ../../config/nvim/plugins/treesitter.fnl;
          type = "fennel";
        }

        vim-just

        {
          plugin = rainbow-delimiters-nvim;
          config = builtins.readFile ../../config/nvim/plugins/rainbow-delimiters.fnl;
          type = "fennel";
        }

        {
          plugin = todo-comments-nvim;
          config = builtins.readFile ../../config/nvim/plugins/todo-comments.fnl;
          type = "fennel";
        }

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

        telescope-ui-select-nvim
        telescope-undo-nvim

        # LSP
        {
          plugin = nvim-lspconfig;
          config = builtins.readFile ../../config/nvim/plugins/lsp.fnl;
          type = "fennel";
        }

        nvim-jdtls

        schemastore-nvim

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

        # cmp
        {
          plugin = nvim-cmp;
          config = builtins.readFile ../../config/nvim/plugins/cmp.fnl;
          type = "fennel";
        }

        cmp-nvim-lsp
        cmp_luasnip
        cmp-async-path
        cmp-buffer
        cmp-cmdline
        cmp-nvim-lsp-document-symbol

        # Formatting

        {
          plugin = conform-nvim;
          config = builtins.readFile ../../config/nvim/plugins/formatter.fnl;
          type = "fennel";
        }

        # Pairs
        {
          plugin = nvim-autopairs;
          config = builtins.readFile ../../config/nvim/plugins/autopairs.fnl;
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
          plugin = oil-nvim;
          config = /* fennel */ ''
            (let [oil (require :oil)]
              (oil.setup))
          '';
          type = "fennel";
        }

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
          config = /* fennel */ ''
            (let [virt-column (require :virt-column)]
              (virt-column.setup))
          '';
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

        {
          plugin = fidget-nvim;
          config = builtins.readFile ../../config/nvim/plugins/fidget.fnl;
          type = "fennel";
        }

        {
          plugin = which-key-nvim;
          config = builtins.readFile ../../config/nvim/plugins/which-key.fnl;
          type = "fennel";
        }

        {
          plugin = neogit;
          config = builtins.readFile ../../config/nvim/plugins/neogit.fnl;
          type = "fennel";
        }
      ] ++ optionals isDarwin [
        {
          plugin = pkgs.vimPlugins.cmp-tabnine;
          config = builtins.readFile ../../config/nvim/plugins/cmp_tabnine.fnl;
          type = "fennel";
        }
      ];
  };

  xdg.configFile."nvim" = {
    source = pkgs.runCommand "nvim-fennel-files"
      {
        nativeBuildInputs = with pkgs; [ luajitPackages.fennel ];
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

        echo "Compiling $fnlfile -> $out/lua/nifoc/$file_out_path"
        $fennel "$fnlfile" > "$out/lua/nifoc/$file_out_path"
      done

      # ftplugin
      ftplugin_store_path="$config_store_path/ftplugin"
      ftplugin_store_fnl="$(find "$ftplugin_store_path" -type f -name '*.fnl')"

      for fnlfile in $ftplugin_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$ftplugin_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile -> $out/ftplugin/$file_out_path"
        $fennel "$fnlfile" > "$out/ftplugin/$file_out_path"
      done

      # After
      after_store_path="$config_store_path/after"
      after_store_fnl="$(find "$after_store_path" -type f -name '*.fnl')"

      for fnlfile in $after_store_fnl; do
        file_out_path="$(echo "$fnlfile" | sed "s|$after_store_path/||" | sed "s/.fnl$/.lua/")"

        echo "Compiling $fnlfile -> $out/after/$file_out_path"
        $fennel "$fnlfile" > "$out/after/$file_out_path"
      done

      # Plugins
      echo "Compiling plugin configuration ..."
      {
      cat <<EOF
      ${config.programs.neovim.generatedConfigs.fennel}
      nil
      EOF
      } > "$out/lua/configuration/plugins.fnl"
      $fennel "$out/lua/configuration/plugins.fnl" > "$out/lua/configuration/plugins.lua"
      rm -f "$out/lua/configuration/plugins.fnl"

      # Other
      echo "Copying tree-sitter queries ..."
      cp -r "$after_store_path/queries" "$out/after/"
    '';
    recursive = true;
  };

  home = {
    file =
      let
        nvim-spell-directory = "${config.xdg.configHome}/nvim/spell";
      in
      {
        "${nvim-spell-directory}/de.utf-8.spl".source = builtins.fetchurl {
          url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.spl";
          sha256 = "73c7107ea339856cdbe921deb92a45939c4de6eb9c07261da1b9dd19f683a3d1";
        };

        "${nvim-spell-directory}/de.utf-8.sug".source = builtins.fetchurl {
          url = "http://ftp.vim.org/pub/vim/runtime/spell/de.utf-8.sug";
          sha256 = "13d0ecf92863d89ef60cd4a8a5eb2a5a13a0e8f9ba8d1c6abe47aba85714a948";
        };
      };

    activation.neovimCache = lib.hm.dag.entryAfter [ "linkGeneration" ] /* bash */ ''
      $VERBOSE_ECHO "Resetting loader"
      $DRY_RUN_CMD ${lib.getExe config.programs.neovim.finalPackage} -l <(echo "vim.loader.reset()")
    '';
  };
}
