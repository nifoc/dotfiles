{ pkgs, lib, ... }:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;
  inherit (lib.attrsets) optionalAttrs;
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
          rev = "1.19.1";
          hash = "sha256-BGHfwKoMfOZUsa05kEt8W2luc1aC3Su/OyaGmcb4UiI=";
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
      upa = "nix flake update ~/.config/nixpkgs -v && upn";
      ngc = "nix-collect-garbage -d && sudo nix-collect-garbage -d";
      nsr = "sudo nix-store --verify --check-contents --repair";

      la = "${lib.getExe pkgs.eza} --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "${lib.getExe pkgs.eza} --long --all --group --header --git";
      lt = "${lib.getExe pkgs.eza} --long --all --group --header --tree --level ";
    } // optionalAttrs isDarwin {
      tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    };

    functions = {
      base64decode = /* fish */ ''
        echo "$argv" | base64 --decode
      '';

      nrsw = /* fish */ ''
        set -f os (uname)
        set -f other_hostname $argv[1]

        switch $os
            case Darwin
                set -f config_dir "$HOME/.config/nixpkgs"
            case Linux
                set -f config_dir /etc/nixos
            case '*'
                echo "Unsupported OS"
                exit 1
        end

        pushd "$config_dir"
        rm -rf result

        if test -z "$DIRENV_DIR"
            eval (direnv export fish 2>/dev/null)
        end

        if test "$other_hostname" = ""
            just deploy-local-machine (hostname -s)
        else
            just deploy-remote-machine "$other_hostname"
        end

        rm -f result
        popd
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

      wezssh = /* fish */ ''
        wezterm cli spawn --domain-name "SSH:$argv"
      '';

      wget-browser = /* fish */ ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        ${lib.getExe pkgs.wget} -U "$user_agent" $argv
      '';

      aria-browser = /* fish */ ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        ${lib.getExe pkgs.aria2} -U "$user_agent" --file-allocation none --async-dns=false -x 2 $argv
      '';

      macos-app-id = /* fish */ ''
        osascript -e "id of app \"$argv\""
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
