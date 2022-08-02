{ pkgs, config, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      # https://github.com/oh-my-fish/plugin-foreign-env
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "b3dd471bcc885b597c3922e4de836e06415e52dd";
          sha256 = "sha256-3h03WQrBZmTXZLkQh1oVyhv6zlyYsSDS7HTHr+7WjY8=";
        };
      }

      # https://github.com/dracula/fish
      {
        name = "dracula";
        src = pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "fish";
          rev = "62b109f12faab5604f341e8b83460881f94b1550";
          sha256 = "sha256-0TlKq2ur2I6Bv7pu7JObrJxV0NbQhydmCuUs6ZdDU1I=";
        };
      }

      {
        name = "done-fish";
        src = pkgs.fetchFromGitHub {
          owner = "nifoc";
          repo = "done";
          rev = "2f4e94d8306224f63cd12fb992318985a83d51a8";
          sha256 = "Pq8HEISGjpCTXBIyukcLUK8r1hJ3/QXAklRCesm4nQ0=";
        };
      }

      # https://github.com/PatrickF1/fzf.fish/releases
      {
        name = "fzf-fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "v9.0";
          sha256 = "sha256-0rnd8oJzLw8x/U7OLqoOMQpK81gRc7DTxZRSHxN9YlM=";
        };
      }

      # https://github.com/jorgebucaran/autopair.fish/releases
      {
        name = "autopair-fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "1.0.4";
          sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }

      # https://github.com/nickeb96/puffer-fish
      {
        name = "puffer-fish";
        src = pkgs.fetchFromGitHub {
          owner = "nickeb96";
          repo = "puffer-fish";
          rev = "f8df25bde0875359805967aa999744a28dee0561";
          sha256 = "sha256-Gm4In5f03G2ijL1xDTKFsgE+hRXjQ29kk84LQSXXeF0=";
        };
      }

      # https://github.com/andreiborisov/sponge/releases
      {
        name = "sponge";
        src = pkgs.fetchFromGitHub {
          owner = "andreiborisov";
          repo = "sponge";
          rev = "1.0.4";
          sha256 = "sha256-+GGfFC/hH7A8n9Wwojt5PW96fSzvRhThnZ3pLeWEqds=";
        };
      }

      # https://github.com/PatrickF1/colored_man_pages.fish
      {
        name = "colored_man_pages";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "colored_man_pages.fish";
          rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
          sha256 = "sha256-ii9gdBPlC1/P1N9xJzqomrkyDqIdTg+iCg0mwNVq2EU=";
        };
      }
    ];

    shellAliases = {
      drsw = "nix-darwin-switch";
      upa = "nix flake update ~/.config/nixpkgs -v && upn";
      upn = "$HOME/.config/nixpkgs/home/programs/nvim/update-plugins.sh";
      ngc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nsr = "sudo nix-store --verify --check-contents --repair";

      j = "z";
      ji = "zi";
      la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "exa --long --all --group --header --git";
      lt = "exa --long --all --group --header --tree --level ";
      s = "kitty +kitten ssh";
      ytdl = "ytdl_with_options";
      ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
      yti = "ytdl_with_options -F";

      mysqld-direnv-init = "mysql_install_db --user $USER --datadir=$PWD/.direnv/mysql/data --auth-root-authentication-method=normal";
      mysqld-direnv = "mysqld --datadir=$PWD/.direnv/mysql/data --bind-address=127.0.0.1 --socket=$PWD/.direnv/mysql/mysqld.sock --gdb";
      postgres-direnv-init = "initdb --username $USER --pgdata $PWD/.direnv/postgres/data --auth trust";
      postgres-direnv = "postgres -D $PWD/.direnv/postgres/data";
      redis-direnv = "redis-server --dir $PWD/.direnv/redis --bind 127.0.0.1";
    };

    functions = {
      podman = ''
        fish -c "set -e SSH_AUTH_SOCK; ${config.home.profileDirectory}/bin/podman $argv"
      '';

      upp = ''
        if not test -f ./.envrc; or rg --quiet '^use flake$' ./.envrc
          nix flake update ./ -v
        else
          nix flake update (rg --no-line-number --color never '^use flake' ./.envrc | cut -d ' ' -f 3 | xargs -I {} sh -c 'echo {}') -v
        end
      '';

      wget-browser = ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        wget -U "$user_agent" $argv
      '';

      aria-browser = ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        aria2c -U "$user_agent" --file-allocation none -x 2 $argv
      '';

      ytdl_with_options = ''
        yt-dlp --config-location "$HOME/.config/yt-dlp/config" --download-archive "$HOME/.config/yt-dlp/archive" $argv
      '';
    };

    shellInit = ''
      # Disable greeting
      set fish_greeting

      if test (uname) = "Darwin"; and test -z "$__NIX_DARWIN_SET_ENVIRONMENT_DONE"
        set __nifoc_nix_darwin_set_env (cat /run/current-system/etc/bashrc | grep '-set-environment' | cut -d '.' -f 2)
        fenv source "$__nifoc_nix_darwin_set_env"
      end

      if test -d "$HOME/.bin"
        set -gx PATH "$HOME/.bin" $PATH
      end

      # Custom Scripts
      if test -d "$HOME/.config/fish/custom-scripts"
        for custom_script in $HOME/.config/fish/custom-scripts/*.fish
          source "$custom_script"
        end
      end

      # Plugin: done
      set -g __done_min_cmd_duration 10000
    '';

    interactiveShellInit = ''
      if [ "$TERM" = "xterm-kitty" ]
        alias ssh "env TERM=xterm-256color ssh"
      end
    '';
  };
}
