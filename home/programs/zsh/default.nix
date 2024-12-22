{ pkgs, lib, config, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;
  inherit (lib.attrsets) optionalAttrs;
in
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableVteIntegration = !config.programs.wezterm.enable;

    autosuggestion = {
      enable = true;
      strategy = [ "completion" ];
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" ];
    };

    plugins = [
      {
        # https://github.com/dracula/zsh-syntax-highlighting
        name = "dracula-zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.sh";
        src = fetchFromGitHub {
          owner = "dracula";
          repo = "zsh-syntax-highlighting";
          rev = "09c89b657ad8a27ddfe1d6f2162e99e5cce0d5b3";
          hash = "sha256-JrSKx8qHGAF0DnSJiuKWvn6ItQHvWpJ5pKo4yNbrHno=";
        };
      }

      {
        # https://github.com/trystan2k/zsh-tab-title
        name = "zsh-tab-title";
        file = "zsh-tab-title.plugin.zsh";
        src = fetchFromGitHub {
          owner = "trystan2k";
          repo = "zsh-tab-title";
          rev = "9c36ac968fe675edcc181a41b0b8959024a8b6c1";
          hash = "sha256-ZEhbQ+yIfCz+vmua7XYBQ4kSVgwoNR8Y4zJyKNypsz0=";
        };
      }

      {
        # https://github.com/Freed-Wu/zsh-colorize-functions
        name = "zsh-colorize-functions";
        file = "zsh-colorize-functions.plugin.zsh";
        src = fetchFromGitHub {
          owner = "Freed-Wu";
          repo = "zsh-colorize-functions";
          rev = "46a299f8f8b1c71867679eaf4f67e30fd2746820";
          hash = "sha256-DvqhWgox8v3Km1Rzkg7tEDqJ2zF62K6ILAzlOhUbuCc=";
        };
      }

      {
        # https://github.com/Freed-Wu/zsh-help
        name = "zsh-help";
        file = "zsh-help.plugin.zsh";
        src = fetchFromGitHub {
          owner = "Freed-Wu";
          repo = "zsh-help";
          rev = "95cbc114078d8209730e38c72a6fa5859ca0773d";
          hash = "sha256-ij+ooXQxV3CmsCN/CrJMicTWvS+9GYHA/1Kuqh5zXIY=";
        };
      }
    ] ++ optionals isDarwin [
      {
        # https://github.com/MichaelAquilina/zsh-auto-notify
        name = "zsh-auto-notify";
        file = "auto-notify.plugin.zsh";
        src = fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-auto-notify";
          rev = "27c07dddb42f05b199319a9b66473c8de7935856";
          hash = "sha256-ScBwky33leI8mFMpAz3Ng2Z0Gbou4EWMOAhkcMZAWIc=";
        };
      }
    ];

    shellAliases =
      let
        ezaExe = lib.getExe pkgs.eza;
      in
      {
        upa = "nix flake update ~/.config/nixpkgs -v && upn";
        ngc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
        nsr = "sudo nix-store --verify --check-contents --repair";

        la = "${ezaExe} --long --all --group --header --group-directories-first --sort=type --icons";
        lg = "${ezaExe} --long --all --group --header --git";
        lt = "${ezaExe} --long --all --group --header --tree --level ";
      } // optionalAttrs isDarwin {
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
      };

    initExtra = /* sh */ ''
      # Keymaps
      bindkey '^[[1;3C' forward-word  # Alt+Right
      bindkey '^[[1;3D' backward-word # Alt+Left

      # Plugins
      ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=true
      ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true

      AUTO_NOTIFY_THRESHOLD=10

      # Path configuration
      if [[ -d "$HOME/.bin" ]]; then
        path=("$HOME/.bin" $path)
        export PATH
      fi

      () {
        local user_functions="$HOME/.zsh/user_functions"
        if [[ -d $user_functions ]]; then
          typeset -TUg +x FPATH=$user_functions:$FPATH fpath
          autoload ''${=$(cd "$user_functions" && echo *)}
        fi

        local server_functions="$HOME/.zsh/server_functions"
        if [[ -d $server_functions ]]; then
          typeset -TUg +x FPATH=$server_functions:$FPATH fpath
          autoload ''${=$(cd "$server_functions" && echo *)}
        fi
      }
    '';
  };

  home.file.".zsh/user_functions" = {
    source = ./functions;
    recursive = true;
  };

  # Plugin dependencies
  programs.bat.enable = true;
}
