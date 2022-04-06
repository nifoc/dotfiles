{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Shell
      shell = "${pkgs.fish.outPath}/bin/fish --interactive";
      shell_integration = "no-cursor";

      # Theme/Layout
      window_padding_width = 3;
      tab_title_template = "\"{index}: {title[:25]}\"";
      tab_bar_style = "separator";
      tab_separator = "\" ┇ \"";
      macos_titlebar_color = "background";
      macos_traditional_fullscreen = true;
      macos_show_window_title_in = "window";

      # UX
      kitty_mod = "cmd";
      cursor_blink_interval = 0;
      macos_custom_beam_cursor = true;
      disable_ligatures = "cursor";
      enable_audio_bell = false;
      visual_bell_duration = 0;
      bell_on_tab = "\" \"";

      # Mouse
      detect_urls = false;
      allow_hyperlinks = false;

      # Scrollback
      scrollback_pager_history_size = 2;
    };

    theme = "Dracula";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };
  };

  home.sessionVariables.TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
}
