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
      ast-grep
      universal-ctags
      fzf
      chafa

      # LSP
      bash-language-server
      fennel-ls
      nil
      #nixd
      taplo-lsp

      # Tools
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
      lua-language-server
      marksman
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server

      # Tools
      curl
      openapi-tui
      serie
      serpl

      # Other
      xcbuild
    ];

    extraLuaConfig = /* lua */ ''
      vim.loader.enable()

      _G.nifoc_default_shell = '${pkgs.zsh.outPath}/bin/zsh'
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

        {
          plugin = vimPlugins.mini-nvim;
          config = builtins.readFile ../../config/nvim/plugins/mini.fnl;
          type = "fennel";
        }

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

        {
          plugin = vimPlugins.nvim-navic;
          config = builtins.readFile ../../config/nvim/plugins/navic.fnl;
          type = "fennel";
        }

        # Linter
        {
          plugin = vimPlugins.nvim-lint;
          config = builtins.readFile ../../config/nvim/plugins/nvim-lint.fnl;
          type = "fennel";
        }

        # Snippets
        vimPlugins.friendly-snippets

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

        # UI
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

        {
          plugin = nvim-treesitter-context;
          config = builtins.readFile ../../config/nvim/plugins/context.fnl;
          type = "fennel";
        }

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
      ] ++ optionals isDarwin [
        {
          plugin = vimPlugins.supermaven-nvim;
          config = builtins.readFile ../../config/nvim/plugins/supermaven.fnl;
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
          url = "https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.spl";
          sha256 = "1ld3hgv1kpdrl4fjc1wwxgk4v74k8lmbkpi1x7dnr19rldz11ivk";
        };

        "${nvim-spell-directory}/de.utf-8.sug".source = builtins.fetchurl {
          url = "https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.sug";
          sha256 = "0j592ibsias7prm1r3dsz7la04ss5bmsba6l1kv9xn3353wyrl0k";
        };
      };

    activation.neovimCache = lib.hm.dag.entryAfter [ "linkGeneration" ] /* bash */ ''
      $VERBOSE_ECHO "Resetting loader"
      $DRY_RUN_CMD ${lib.getExe config.programs.neovim.finalPackage} -l <(echo "vim.loader.reset()")
    '';

    activation.neovimTreeSitter = lib.hm.dag.entryAfter [ "writeBoundary" ] /* bash */ ''
      $VERBOSE_ECHO "Updating tree-sitter parsers"

      export CC='${pkgs.stdenv.cc}/bin/${pkgs.stdenv.cc.targetPrefix}cc'
      export CXX='${pkgs.stdenv.cc}/bin/${pkgs.stdenv.cc.targetPrefix}c++'
      $DRY_RUN_CMD ${lib.getExe config.programs.neovim.finalPackage} -c 'TSUpdateSync | q' --headless
    '';
  };
}
