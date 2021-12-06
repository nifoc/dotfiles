{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = true;

      cmd_duration = {
        format = "\\[[ $duration]($style)\\]";
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

      java = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      nix_shell = {
        symbol = " ";
        format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
      };

      nodejs = {
        symbol = " ";
        format = "\\[[$symbol($version)]($style)\\]";
      };

      package = {
        symbol = " ";
        format = "\\[[$symbol$version]($style)\\]";
      };

      php = {
        symbol = " ";
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

      time = {
        format = "\\[[$time]($style)\\]";
      };
    };
  };
}
