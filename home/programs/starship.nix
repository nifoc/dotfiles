{ lib, config, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableTransience = true;

    settings = {
      add_newline = true;

      character = {
        success_symbol = "[󰘧](bold green)";
        error_symbol = "[󰘧](bold red)";
      };

      cmd_duration = {
        style = "yellow";
        format = "[ $duration]($style)";
      };

      direnv = {
        disabled = false;
        symbol = "󱁿 ";
        format = "\\[[$symbol$loaded/$allowed]($style)\\]";
      };

      docker_context = {
        symbol = " ";
        format = "\\[[$symbol$context]($style)\\]";
      };

      elixir = {
        symbol = " ";
        format = "\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\]";
      };

      erlang = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      git_branch = {
        symbol = " ";
        format = "\\[[$symbol$branch]($style)\\]";
      };

      gradle = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = " ";
        detect_env_vars = [
          "SSH_CONNECTION"
          "SSH_CLIENT"
          "SSH_TTY"
          "NIFOC_SSH_CONNECTION"
        ];
        format = "\\[[$ssh_symbol$hostname]($style)\\]";
      };

      java = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      nix_shell = {
        symbol = " ";
        format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
      };

      nodejs = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      os = {
        disabled = true;
        format = "$symbol";

        symbols = {
          Macos = " ";
          NixOS = " ";
        };
      };

      package = {
        symbol = " ";
        format = "\\[[$symbol$version]($style)\\]";
      };

      php = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      python = {
        symbol = " ";
        format = "\\[[\${symbol}\${pyenv_prefix}(\${version})(\\($virtualenv\\))]($style)\\]";
      };

      ruby = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      status = {
        disabled = false;
        symbol = " ";
        success_symbol = "";
        not_executable_symbol = " ";
        not_found_symbol = " ";
        sigint_symbol = " ";
        signal_symbol = " ";
        map_symbol = true;
      };

      time = {
        format = "\\[[$time]($style)\\]";
      };

      username = {
        detect_env_vars = [
          "SSH_CONNECTION"
          "SSH_CLIENT"
          "SSH_TTY"
          "NIFOC_SSH_CONNECTION"
        ];
        format = "\\[[ $user]($style)\\]";
      };

      format = "$all";
      right_format = "$cmd_duration";
    };
  };

  programs.fish.interactiveShellInit = lib.mkIf config.programs.starship.enableTransience ''
    function starship_transient_prompt_func
      starship module character
    end

    function starship_transient_rprompt_func
      starship module cmd_duration
    end
  '';
}
