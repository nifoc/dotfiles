{ pkgs, ... }:

let
  settingsFormat = pkgs.formats.yaml { };

  window_padding = 5;
  disable-keybinding = { mod = ""; key = ""; };

  settings = {
    # Settings
    layouts = [
      "tall"
      "fullscreen"
      "wide"
      "two-pane"
      "column"
    ];
    enables-layout-hud = true;
    enables-layout-hud-on-space-change = true;

    disable-padding-on-builtin-display = false;
    window-margins = true;
    smart-window-margins = true;
    window-margin-size = window_padding;
    window-resize-step = 5;
    screen-padding-left = 0;
    screen-padding-right = 0;
    screen-padding-top = 0;
    screen-padding-bottom = 0;

    window-max-count = 0;
    window-minimum-height = 0;
    window-minimum-width = 0;

    floating-is-blacklist = true;
    float-small-windows = true;
    floating = [
      "at.obdev.LaunchBar"
      "com.apple.systempreferences"
      "com.eltima.elmedia-setapp"
      "com.jonny.mona"
      "com.kapeli.dash-setapp"
      "com.sindresorhus.Dato-setapp"
    ];

    new-windows-to-main = false;
    follow-space-thrown-windows = true;

    ignore-menu-bar = false;
    hide-menu-bar-icon = false;
    mouse-follows-focus = false;
    focus-follows-mouse = false;
    mouse-swaps-windows = true;
    mouse-resizes-windows = false;
    restore-layouts-on-launch = true;
    debug-layout-info = false;
    use-canary-build = false;

    # Keybindings
    mod1 = [ "option" "shift" ];
    mod2 = [ "option" "shift" "control" ];

    focus-ccw = { mod = "mod1"; key = "h"; };
    focus-cw = { mod = "mod1"; key = "l"; };
    focus-main = { mod = "mod1"; key = "m"; };

    focus-screen-ccw = { mod = "mod1"; key = "e"; };
    focus-screen-cw = { mod = "mod1"; key = "w"; };

    swap-ccw = { mod = "mod2"; key = "h"; };
    swap-cw = { mod = "mod2"; key = "l"; };
    swap-main = { mod = "mod2"; key = "m"; };

    swap-screen-ccw = { mod = "mod2"; key = "e"; };
    swap-screen-cw = { mod = "mod2"; key = "w"; };

    toggle-float = { mod = "mod2"; key = "t"; };

    select-tall-layout = { mod = "mod2"; key = "a"; };
    select-wide-layout = { mod = "mod2"; key = "s"; };
    select-fullscreen-layout = { mod = "mod2"; key = "f"; };
    select-column-layout = { mod = "mod2"; key = "c"; };
    display-current-layout = { mod = "mod1"; key = "i"; };
    reevaluate-windows = { mod = "mod2"; key = "b"; };

    throw-space-left = disable-keybinding;
    throw-space-right = disable-keybinding;

    toggle-tiling = disable-keybinding;

    toggle-focus-follows-mouse = disable-keybinding;
    relaunch-amethyst = { mod = "mod2"; key = "z"; };
  };
in
{
  xdg.configFile."amethyst/amethyst.yml".source = settingsFormat.generate "amethyst.yml" settings;
}
