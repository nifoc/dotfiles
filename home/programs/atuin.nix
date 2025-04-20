{
  programs = {
    atuin = {
      enable = true;

      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = false;

      daemon = {
        enable = true;
        logLevel = "error";
      };

      settings = {
        auto_sync = true;
        sync_address = "https://atuin-sync.kempkens.io";
        sync_frequency = "30m";
        update_check = false;

        theme.name = "dracula";
        style = "compact";
        inline_height = 25;
        search_mode = "skim";
        filter_mode_shell_up_key_binding = "directory";

        history_filter = [
          "^base64decode"
          "^instagram-dl"
          "^mp4concat"
        ];
      };

      themes = {
        dracula = {
          theme.name = "Dracula";

          colors = {
            AlertInfo = "#D6ACFF";
            AlertWarn = "#FFFFA5";
            AlertError = "#FF6E6E";
            Annotation = "#6272A4";
            Base = "#F8F8F2";
            Guidance = "#50FA7B";
            Important = "#A4FFFF";
            Title = "#ABB2BF";
          };
        };
      };
    };

    zsh.history = {
      save = 0;
      size = 0;
      share = false;
    };

    fish.shellInit = ''
      set -x fish_history ""
    '';
  };
}
