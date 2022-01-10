{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }

      {
        name = "dracula";
        src = pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "fish";
          rev = "28db361b55bb49dbfd7a679ebec9140be8c2d593";
          sha256 = "vdqYlEyYvlPVgTkwXbE8GVZo0UBBT88JyMSWYykhfx4=";
        };
      }

      {
        name = "fzf-fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "v.7.4";
          sha256 = "dngAKzyD+lmqmxsCSOMViyCgA/+Ve35gLtPS+Lgs8Pc=";
        };
      }

      {
        name = "autopair-fish";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "1.0.3";
          sha256 = "l6WJ2kjDO/TnU9FSigjxk5xFp90xl68gDfggkE/wrlM=";
        };
      }

      {
        name = "colored_man_pages";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "colored_man_pages.fish";
          rev = "8c4965b9be9433d12ba50c28452cab8c71c59a50";
          sha256 = "jhvC9wTU/mUwEaKeepsUEJsvVuCiO/opcp09SzkItV8=";
        };
      }
    ];

    shellAliases = {
      hmsw = "home-manager switch --flake ~/.config/nixpkgs/#$USER";
      j = "z";
      ji = "zi";
      la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "exa --long --all --group --header --git";
      lt = "exa --long --all --group --header --tree --level ";
      docker = "podman";
      ytdl = "ytdl_with_options";
      ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
      yti = "ytdl_with_options -F";
      upa = "nix flake update ~/.config/nixpkgs -v";
      upn = "$HOME/.config/nixpkgs/programs/nvim/update-plugins.sh";
      ucl = "nix-collect-garbage -d && nix-store --gc && calculate-nix-path";
    };

    functions = {
      upp = ''
        if rg --quiet '^use flake$' ./.envrc
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

      if test -e "$HOME/.cache/fish/nix_path_value"
        set -gx NIX_PATH (cat "$HOME/.cache/fish/nix_path_value")
      end

      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      end

      if test -d "$HOME/.bin"
        set -gx PATH "$HOME/.bin" $PATH
      end

      for app_path in \
        "/Applications/Little Snitch.app/Contents/Components" \
        "/Applications/Wireshark.app/Contents/MacOS" \
        "/usr/local/MacGPG2/bin"

        if test -d "$app_path"
          set -gx PATH $PATH "$app_path"
        end
      end

      # Vendor Configuration
      for vendor_conf in \
        "$HOME/.nix-profile/share/fish/vendor_conf.d/direnv.fish"

        if test -f "$vendor_conf"
          source "$vendor_conf"
        end
      end

      # Custom Scripts
      if test -d "$HOME/.config/fish/custom-scripts"
        for custom_script in $HOME/.config/fish/custom-scripts/*.fish
          source "$custom_script"
        end
      end
    '';

    interactiveShellInit = ''
      if [ "$TERM" = "xterm-kitty" ]
        alias ssh "kitty +kitten ssh"
      end
    '';
  };
}
