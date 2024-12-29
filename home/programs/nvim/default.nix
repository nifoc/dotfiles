{ pkgs, config, lib, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;

  inherit (pkgs) vimPlugins;
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;

    defaultEditor = true;

    withNodeJs = false;
    withRuby = false;
    withPython3 = false;

    extraLuaPackages = luaPkgs: with luaPkgs; [ lua-toml readline ];

    extraPackages = with pkgs; [
      stdenv.cc

      git
      delta
      nodejs
      tree-sitter
      fd
      ripgrep
      universal-ctags
      fzf
      chafa

      # LSP
      bash-language-server
      fennel-ls
      nil
      #nixd
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
      # LSP
      #elixir-ls
      lexical
      #lua-language-server
      marksman
      #next-ls
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server

      # Other
      xcbuild
    ];

    extraLuaConfig = /* lua */ ''
      vim.loader.enable()
      _G.nvim_treesitter_parser_directory = os.getenv("HOME") .. "/.local/share/nvim/nvim-treesitter_parser"
      vim.opt.runtimepath:prepend(_G.nvim_treesitter_parser_directory)

      require('nifoc.nix')
      require('configuration.init')
    '';

    plugins =
      let
        customPlugins = import ./plugins.nix { inherit pkgs lib; };
      in
      with customPlugins; [
        # Utils
        vimPlugins.popup-nvim
        vimPlugins.plenary-nvim
        vimPlugins.nvim-web-devicons

        {
          plugin = vimPlugins.wezterm-nvim;
          config = builtins.readFile ../../config/nvim/plugins/wezterm.fnl;
          type = "fennel";
        }

        vimPlugins.vim-cool

        # Keybindings
        {
          plugin = vimPlugins.yanky-nvim;
          config = builtins.readFile ../../config/nvim/plugins/yanky.fnl;
          type = "fennel";
        }

        {
          plugin = cutlass-nvim;
          config = builtins.readFile ../../config/nvim/plugins/cutlass.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.substitute-nvim;
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

        {
          plugin = vimPlugins.rainbow-delimiters-nvim;
          config = builtins.readFile ../../config/nvim/plugins/rainbow-delimiters.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.todo-comments-nvim;
          config = builtins.readFile ../../config/nvim/plugins/todo-comments.fnl;
          type = "fennel";
        }

        # Finder
        {
          plugin = vimPlugins.fzf-lua;
          config = builtins.readFile ../../config/nvim/plugins/fzf.fnl;
          type = "fennel";
        }

        # LSP
        {
          plugin = nvim-lspconfig;
          config = builtins.readFile ../../config/nvim/plugins/lsp.fnl;
          type = "fennel";
        }

        vimPlugins.nvim-jdtls

        vimPlugins.SchemaStore-nvim

        vimPlugins.lspkind-nvim

        {
          plugin = vimPlugins.nvim-navic;
          config = builtins.readFile ../../config/nvim/plugins/navic.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.vim-illuminate;
          config = builtins.readFile ../../config/nvim/plugins/illuminate.fnl;
          type = "fennel";
        }

        # Linter
        {
          plugin = vimPlugins.nvim-lint;
          config = builtins.readFile ../../config/nvim/plugins/nvim-lint.fnl;
          type = "fennel";
        }

        # Comments
        {
          plugin = ts-comments-nvim;
          config = builtins.readFile ../../config/nvim/plugins/comment.fnl;
          type = "fennel";
        }

        # Snippets
        {
          plugin = vimPlugins.luasnip;
          config = builtins.readFile ../../config/nvim/plugins/luasnip.fnl;
          type = "fennel";
        }

        # Completion
        {
          plugin = vimPlugins.blink-cmp;
          config = builtins.readFile ../../config/nvim/plugins/blink-cmp.fnl;
          type = "fennel";
        }

        vimPlugins.blink-compat

        # Formatting

        {
          plugin = vimPlugins.conform-nvim;
          config = builtins.readFile ../../config/nvim/plugins/formatter.fnl;
          type = "fennel";
        }

        # Pairs
        {
          plugin = nvim-autopairs;
          config = builtins.readFile ../../config/nvim/plugins/autopairs.fnl;
          type = "fennel";
        }

        # Textobjects
        nvim-treesitter-textobjects

        {
          plugin = vimPlugins.nvim-surround;
          config = builtins.readFile ../../config/nvim/plugins/surround.fnl;
          type = "fennel";
        }

        # UI
        {
          plugin = vimPlugins.oil-nvim;
          config = /* fennel */ ''
            (let [oil (require :oil)]
              (oil.setup))
          '';
          type = "fennel";
        }

        {
          plugin = vimPlugins.heirline-nvim;
          config = builtins.readFile ../../config/nvim/plugins/heirline.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.indent-blankline-nvim;
          config = builtins.readFile ../../config/nvim/plugins/indent_line.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.virt-column-nvim;
          config = /* fennel */ ''
            (let [virt-column (require :virt-column)]
              (virt-column.setup))
          '';
          type = "fennel";
        }

        nvim-treesitter-context

        {
          plugin = vimPlugins.urlview-nvim;
          config = builtins.readFile ../../config/nvim/plugins/urlview.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.hover-nvim;
          config = builtins.readFile ../../config/nvim/plugins/hover.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.gitsigns-nvim;
          config = builtins.readFile ../../config/nvim/plugins/gitsigns.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.diffview-nvim;
          config = builtins.readFile ../../config/nvim/plugins/diffview.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.neogit;
          config = builtins.readFile ../../config/nvim/plugins/neogit.fnl;
          type = "fennel";
        }

        {
          plugin = fidget-nvim;
          config = builtins.readFile ../../config/nvim/plugins/fidget.fnl;
          type = "fennel";
        }

        {
          plugin = vimPlugins.which-key-nvim;
          config = builtins.readFile ../../config/nvim/plugins/which-key.fnl;
          type = "fennel";
        }
      ] ++ optionals isDarwin [
        {
          plugin = vimPlugins.cmp-tabnine;
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

    activation.neovimTreeSitter = lib.hm.dag.entryAfter [ "writeBoundary" ] /* bash */ ''
      $VERBOSE_ECHO "Updating tree-sitter parsers"
      $DRY_RUN_CMD ${lib.getExe config.programs.neovim.finalPackage} -c 'TSUpdateSync | q' --headless
    '';
  };
}
