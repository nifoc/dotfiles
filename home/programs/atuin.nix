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
      filter_mode_shell_up_key_binding = "session";

      history_filter = [
        "^base64decode"
        "^instagram-dl"
      ];
    };
  };

  programs.fish.shellInit = ''
    set -x fish_history ""
  '';
}
