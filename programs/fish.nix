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
    ];

    shellAliases = {
      hmsw = "home-manager switch --flake ~/.config/nixpkgs/#$USER";
      j = "z";
      ji = "zi";
      la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "exa --long --all --group --header --git";
      lt = "exa --long --all --group --header --tree --level ";
      ytdl = "ytdl_with_options";
      ytdl_mp4 = "ytdl_with_options -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]'";
      yti = "ytdl_with_options -F";
      upa = "nix-channel --update nixpkgs && nix flake update ~/.config/nixpkgs -v";
      upp = "nix flake update ./ -v";
      upn = "$HOME/.config/nixpkgs/programs/nvim/update-plugins.sh";
      ucl = "nix-collect-garbage -d && nix-store --gc && nix-store --optimise -v";
    };

    functions = {
      wget-browser = ''
        set user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15"
        wget -U "$user_agent" $argv
      '';

      ytdl_with_options = ''
        yt-dlp --config-location "$HOME/.config/yt-dlp/config" --download-archive "$HOME/.config/youtube-dl/archive" $argv
      '';
    };

    shellInit = ''
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      end

      if test -d "$HOME/bin"
        set -gx PATH "$HOME/bin" $PATH
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
      if test -d "$HOME/.nix-profile/share/fish/vendor_conf.d"
        for vendor_conf in $HOME/.nix-profile/share/fish/vendor_conf.d/*.fish
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
