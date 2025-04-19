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
