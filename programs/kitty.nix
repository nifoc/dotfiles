{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Shell
      shell = "${pkgs.fish.outPath}/bin/fish --interactive";
      shell_integration = "no-cursor";

      # Theme/Layout
      window_border_width = "1.0";
      window_margin_width = "0.0";
      window_padding_width = "1 3 1 3";
      macos_titlebar_color = "background";
      macos_traditional_fullscreen = true;
      macos_show_window_title_in = "window";
      enabled_layouts = "tall:bias=55;tall:bias=50;full_size=1;stack;fat;grid;horizontal;split;mirrored=false;";

      # Tabs
      tab_bar_style = "separator";
      tab_separator = "\"  \"";
      tab_fade = "0 0 0 0";
      tab_activity_symbol = "\" ●\"";
      bell_on_tab = false;
      tab_bar_edge = "bottom";
      tab_bar_background = "#282A36";
      tab_bar_margin_height = "0.0 0.0";
      inactive_tab_foreground = "#F8F8F2";
      inactive_tab_background = "#282A36";
      inactive_tab_font_style = "normal";
      active_tab_foreground = "#F8F8F2";
      active_tab_background = "#282A36";
      active_tab_font_style = "normal";
      tab_bar_min_tabs = 2;
      tab_title_template = "\" {index}: {title[:30]}{fmt.fg._FF5555}{activity_symbol}\"";
      active_tab_title_template = "\" {index}: {title[:30]}\"";

      # UX
      kitty_mod = "cmd";
      cursor_blink_interval = 0;
      macos_custom_beam_cursor = true;
      disable_ligatures = "cursor";
      enable_audio_bell = false;
      visual_bell_duration = 0;

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
