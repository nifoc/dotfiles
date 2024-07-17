{
  programs.atuin = {
    enable = true;

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;

    settings = {
      auto_sync = true;
      sync_address = "https://atuin-sync.kempkens.io";
      sync_frequency = "30m";
      update_check = false;

      style = "auto";
      inline_height = 40;
      search_mode = "fuzzy";
      filter_mode_shell_up_key_binding = "directory";

      history_filter = [
        "^base64decode"
        "^instagram-dl"
        "^mp4concat"
      ];
    };
  };

  programs.fish.shellInit = ''
    set -x fish_history ""
  '';
}
