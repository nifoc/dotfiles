{ den, ... }:

{
  den.aspects.editors = {
    includes = [
      (den.batteries.unfree [ "wezterm.nvim" ])
    ];

    homeManager =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        inherit (pkgs.stdenv) isDarwin;
        inherit (lib) optionals;
      in
      {
        programs.neovim = {
          enable = true;

          defaultEditor = true;

          withNodeJs = false;
          withRuby = false;
          withPython3 = false;

          extraLuaPackages =
            luaPkgs: with luaPkgs; [
              lua-toml
              readline
            ];

          extraPackages =
            with pkgs;
            [
              stdenv.cc

              git
              delta
              nodejs
              tree-sitter
              fd
              ripgrep
              ast-grep
              universal-ctags
              fzf
              chafa

              # LSP
              bash-language-server
              fennel-ls
              nil
              #nixd
              taplo

              # Tools
              checkstyle
              deadnix
              eslint_d
              hadolint
              luajitPackages.fennel
              nixfmt
              shellcheck
              statix
            ]
            ++ optionals isDarwin [
              # LSP
              dockerfile-language-server
              beamMinimal28Packages.expert
              lua-language-server
              marksman
              typescript-language-server
              vscode-langservers-extracted
              yaml-language-server

              # Tools
              curl
              openapi-tui
              serie
              serpl

              # Other
              xcbuild
            ];

          initLua = # lua
            ''
              vim.loader.enable()

              _G.nifoc_default_shell = '${pkgs.zsh.outPath}/bin/zsh'

              require('nifoc.nix')
              require('configuration.init')
            '';

          plugins =
            with pkgs.vimPlugins;
            [
              # Utils
              popup-nvim
              plenary-nvim

              {
                plugin = mini-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/mini.fnl;
                type = "fennel-custom";
              }

              {
                plugin = wezterm-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/wezterm.fnl;
                type = "fennel-custom";
              }

              vim-cool

              # Keybindings
              {
                plugin = yanky-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/yanky.fnl;
                type = "fennel-custom";
              }

              {
                plugin = cutlass-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/cutlass.fnl;
                type = "fennel-custom";
              }

              # Themes
              dracula-nvim

              # Syntax
              {
                plugin = nvim-treesitter.withPlugins (p: [
                  p.angular
                  p.bash
                  p.caddy
                  p.css
                  p.comment
                  p.diff
                  p.dockerfile
                  p.eex
                  p.elixir
                  p.erlang
                  p.fennel
                  p.git_config
                  p.git_rebase
                  p.gitattributes
                  p.gitcommit
                  p.gitignore
                  p.graphql
                  p.heex
                  p.html
                  p.http
                  p.java
                  p.javascript
                  p.jsdoc
                  p.json
                  p.just
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
                  p.styled
                  p.svelte
                  p.toml
                  p.tsx
                  p.typescript
                  p.vim
                  p.yaml
                ]);
                config = builtins.readFile ../../../files/editors/neovim/plugins/treesitter.fnl;
                type = "fennel-custom";
              }

              {
                plugin = rainbow-delimiters-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/rainbow-delimiters.fnl;
                type = "fennel-custom";
              }

              {
                plugin = todo-comments-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/todo-comments.fnl;
                type = "fennel-custom";
              }

              # Finder
              {
                plugin = fzf-lua;
                config = builtins.readFile ../../../files/editors/neovim/plugins/fzf.fnl;
                type = "fennel-custom";
              }

              # LSP
              nvim-jdtls

              SchemaStore-nvim

              {
                plugin = nvim-navic;
                config = builtins.readFile ../../../files/editors/neovim/plugins/navic.fnl;
                type = "fennel-custom";
              }

              # Linter
              {
                plugin = nvim-lint;
                config = builtins.readFile ../../../files/editors/neovim/plugins/nvim-lint.fnl;
                type = "fennel-custom";
              }

              # Snippets
              friendly-snippets

              # Completion
              {
                plugin = blink-cmp;
                config = builtins.readFile ../../../files/editors/neovim/plugins/blink-cmp.fnl;
                type = "fennel-custom";
              }

              blink-compat

              # Formatting

              {
                plugin = conform-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/formatter.fnl;
                type = "fennel-custom";
              }

              # UI
              {
                plugin = heirline-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/heirline.fnl;
                type = "fennel-custom";
              }

              {
                plugin = indent-blankline-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/indent_line.fnl;
                type = "fennel-custom";
              }

              {
                plugin = virt-column-nvim;
                config = # fennel
                  ''
                    (let [virt-column (require :virt-column)]
                      (virt-column.setup))
                  '';
                type = "fennel-custom";
              }

              {
                plugin = nvim-treesitter-context;
                config = builtins.readFile ../../../files/editors/neovim/plugins/context.fnl;
                type = "fennel-custom";
              }

              {
                plugin = urlview-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/urlview.fnl;
                type = "fennel-custom";
              }

              {
                plugin = hover-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/hover.fnl;
                type = "fennel-custom";
              }

              {
                plugin = gitsigns-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/gitsigns.fnl;
                type = "fennel-custom";
              }

              {
                plugin = diffview-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/diffview.fnl;
                type = "fennel-custom";
              }
            ]
            ++ optionals isDarwin [
              {
                plugin = flatten-nvim;
                config = builtins.readFile ../../../files/editors/neovim/plugins/flatten.fnl;
                type = "fennel-custom";
              }
            ];
        };

        xdg.configFile."nvim" = {
          source =
            pkgs.runCommand "nvim-fennel-files"
              {
                nativeBuildInputs = with pkgs; [ luajitPackages.fennel ];
              }
              ''
                mkdir -p $out/lua/configuration
                mkdir -p $out/lua/nifoc/utils
                mkdir -p $out/ftplugin
                mkdir -p $out/after/ftplugin
                mkdir -p $out/lsp

                config_store_path="${../../../files/editors/neovim}"
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

                # lsp 
                lsp_store_path="$config_store_path/lsp"
                lsp_store_fnl="$(find "$lsp_store_path" -type f -name '*.fnl')"

                for fnlfile in $lsp_store_fnl; do
                  file_out_path="$(echo "$fnlfile" | sed "s|$lsp_store_path/||" | sed "s/.fnl$/.lua/")"

                  echo "Compiling $fnlfile -> $out/lsp/$file_out_path"
                  $fennel "$fnlfile" > "$out/lsp/$file_out_path"
                done

                # Plugins
                echo "Compiling plugin configuration ..."
                {
                cat <<EOF
                ${config.programs.neovim.generatedConfigs.fennel-custom}
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
                url = "https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.spl";
                sha256 = "1ld3hgv1kpdrl4fjc1wwxgk4v74k8lmbkpi1x7dnr19rldz11ivk";
              };

              "${nvim-spell-directory}/de.utf-8.sug".source = builtins.fetchurl {
                url = "https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.sug";
                sha256 = "0j592ibsias7prm1r3dsz7la04ss5bmsba6l1kv9xn3353wyrl0k";
              };
            };

          activation.neovimCache =
            lib.hm.dag.entryAfter [ "writeBoundary" ] # bash
              ''
                $VERBOSE_ECHO "Resetting loader"
                $DRY_RUN_CMD ${lib.getExe config.programs.neovim.finalPackage} -l <(echo "vim.loader.reset()")
              '';
        };

      };
  };
}
