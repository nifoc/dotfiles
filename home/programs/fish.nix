{ pkgs, lib, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;
in
{

  home.packages = with pkgs; optionals isDarwin [
    terminal-notifier
  ];

  programs.fish = {
    enable = true;

    plugins = [
      # https://github.com/dracula/fish
      {
        name = "dracula";
        src = fetchFromGitHub {
          owner = "dracula";
          repo = "fish";
          rev = "269cd7d76d5104fdc2721db7b8848f6224bdf554";
          hash = "sha256-Hyq4EfSmWmxwCYhp3O8agr7VWFAflcUe8BUKh50fNfY=";
        };
      }

      # https://github.com/franciscolourenco/done/releases
      {
        name = "done-fish";
        src = fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "1.17.1";
          sha256 = "sha256-aYKTkx5v7tB6k/UBcS0NOgA6SiRrjzn1lUTH/Xp5DFM=";
        };
      }

      # https://github.com/PatrickF1/fzf.fish/releases
      {
        name = "fzf-fish";
        src = fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "v10.0";
          hash = "sha256-CqRSkwNqI/vdxPKrShBykh+eHQq9QIiItD6jWdZ/DSM=";
        };
      }

      # https://github.com/jorgebucaran/autopair.fish/releases
      {
        name = "autopair-fish";
        src = fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "1.0.4";
          sha256 = "sha256-s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }

      # https://github.com/nickeb96/puffer-fish
      {
        name = "puffer-fish";
        src = fetchFromGitHub {
          owner = "nickeb96";
          repo = "puffer-fish";
          rev = "5d3cb25e0d63356c3342fb3101810799bb651b64";
          hash = "sha256-aPxEHSXfiJJXosIm7b3Pd+yFnyz43W3GXyUB5BFAF54=";
        };
      }

      # https://github.com/PatrickF1/colored_man_pages.fish
      {
        name = "colored_man_pages";
        src = fetchFromGitHub {
          owner = "PatrickF1";
          repo = "colored_man_pages.fish";
          rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
          sha256 = "sha256-ii9gdBPlC1/P1N9xJzqomrkyDqIdTg+iCg0mwNVq2EU=";
        };
      }
    ];

    shellAliases = {
      nrsw = "nixpkgs-switch";
      upa = "nix flake update ~/.config/nixpkgs -v && upn";
      ngc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nsr = "sudo nix-store --verify --check-contents --repair";

      la = "${pkgs.eza}/bin/eza --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "${pkgs.eza}/bin/eza --long --all --group --header --git";
      lt = "${pkgs.eza}/bin/eza --long --all --group --header --tree --level ";

      mysqld-direnv = "mysqld --datadir=$PWD/.direnv/mysql/data --bind-address=127.0.0.1 --socket=$PWD/.direnv/mysql/mysqld.sock --gdb";
      postgres-direnv-init = "initdb --username $USER --pgdata $PWD/.direnv/postgres/data --auth trust";
      postgres-direnv = "postgres -D $PWD/.direnv/postgres/data";
      redis-direnv = "redis-server --dir $PWD/.direnv/redis --bind 127.0.0.1";
    };

    functions = {
      base64decode = /* fish */ ''
        echo "$argv" | base64 --decode
      '';

      upn = /* fish */ ''
        set -f os (uname)

        switch $os
            case Darwin
                $HOME/.config/nixpkgs/home/programs/nvim/update-plugins.sh
            case Linux
                /etc/nixos/home/programs/nvim/update-plugins.sh
            case '*'
                echo "Unsupported OS"
                exit 1
        end
      '';

      upp = /* fish */ ''
        if not test -f ./.envrc; or rg --quiet '^use flake$' ./.envrc
          nix flake update ./ -v
        else
          nix flake update (rg --no-line-number --color never '^use flake' ./.envrc | cut -d ' ' -f 3 | xargs -I {} sh -c 'echo {}') -v
        end
      '';

      wget-browser = /* fish */ ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        ${pkgs.wget}/bin/wget -U "$user_agent" $argv
      '';

      aria-browser = /* fish */ ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        ${pkgs.aria2}/bin/aria2c -U "$user_agent" --file-allocation none --async-dns=false -x 2 $argv
      '';

      mysqld-direnv-init = /* fish */ ''
        if type -q mysql_install_db
          mysql_install_db --user $USER --datadir=$PWD/.direnv/mysql/data --auth-root-authentication-method=normal
        else
          mysqld --initialize-insecure --user $USER --datadir=$PWD/.direnv/mysql/data
        end
      '';
    };

    shellInit = /* fish */ ''
      # Disable greeting
      set fish_greeting

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
  };

  xdg.configFile."fish/conf.d" = {
    source = ../config/fish;
    recursive = true;
  };
}
