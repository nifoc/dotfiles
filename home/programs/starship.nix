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

      hostname = {
        ssh_only = true;
        ssh_symbol = " ";
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
        format = "\\[[ $user]($style)\\]";
      };
    };
  };
}
