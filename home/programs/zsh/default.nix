{
  pkgs,
  lib,
  config,
  ...
}:

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

    autosuggestion.enable = false;

    syntaxHighlighting = {
      enable = true;
    };

    plugins =
      [
        {
          # https://github.com/Aloxaf/fzf-tab
          name = "fzf-tab";
          src = fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "01dad759c4466600b639b442ca24aebd5178e799";
            hash = "sha256-q26XVS/LcyZPRqDNwKKA9exgBByE0muyuNb0Bbar2lY=";
          };
        }

        {
          # https://github.com/zsh-users/zsh-autosuggestions
          name = "zsh-autosuggestions";
          src = fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "0e810e5afa27acbd074398eefbe28d13005dbc15";
            hash = "sha256-85aw9OM2pQPsWklXjuNOzp9El1MsNb+cIiZQVHUzBnk=";
          };
        }

        {
          # https://github.com/hlissner/zsh-autopair
          name = "zsh-autopair";
          src = fetchFromGitHub {
            owner = "hlissner";
            repo = "zsh-autopair";
            rev = "449a7c3d095bc8f3d78cf37b9549f8bb4c383f3d";
            hash = "sha256-3zvOgIi+q7+sTXrT+r/4v98qjeiEL4Wh64rxBYnwJvQ=";
          };
        }

        {
          # https://github.com/trystan2k/zsh-tab-title
          name = "zsh-tab-title";
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
          src = fetchFromGitHub {
            owner = "Freed-Wu";
            repo = "zsh-help";
            rev = "95cbc114078d8209730e38c72a6fa5859ca0773d";
            hash = "sha256-ij+ooXQxV3CmsCN/CrJMicTWvS+9GYHA/1Kuqh5zXIY=";
          };
        }

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
      ]
      ++ optionals isDarwin [
        {
          # https://github.com/MichaelAquilina/zsh-auto-notify
          name = "zsh-auto-notify";
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
      }
      // optionalAttrs isDarwin {
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
      };

    initExtra = # sh
      ''
        # Options
        setopt AUTO_CD
        setopt AUTO_PUSHD
        setopt INTERACTIVE_COMMENTS

        # Keymaps
        bindkey '^[[1;3C' forward-word  # Alt+Right
        bindkey '^[[1;3D' backward-word # Alt+Left

        # Plugins
        zstyle ':completion:*:git-checkout:*' sort false
        zstyle ':completion:*:descriptions' format '[%d]'
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:*' use-fzf-default-opts yes

        ZSH_AUTOSUGGEST_STRATEGY=(completion)

        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
        typeset -gA ZSH_HIGHLIGHT_STYLES

        ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=true
        ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
        ZSH_TAB_TITLE_ADDITIONAL_TERMS='wezterm'

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
