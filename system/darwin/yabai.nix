{ pkgs, lib, ... }:

let
  yabai-pkg = pkgs.yabai;
  yabai-bin = "${yabai-pkg}/bin/yabai";
  jq-bin = "${pkgs.jq}/bin/jq";

  window_padding = 5;

  native-tab-apps = [ "Finder" "TablePlus" ];

  unmanaged-apps = [
    "Dash"
    "Dato"
    "Mona"
    "System.*einstellungen"
  ];

  script-cycle-clockwise = pkgs.writeShellScript "yabai-cycle-clockwise.sh" ''
    win=$(${yabai-bin} -m query --windows --window last | ${jq-bin} '.id')

    while : ; do
      ${yabai-bin} -m window $win --swap prev &> /dev/null
      if [[ $? -eq 1 ]]; then
        break
      fi
    done
  '';

  script-smart-padding = pkgs.writeShellScript "yabai-smart-padding.sh" ''
    space_index=$(${yabai-bin} -m query --spaces --window $YABAI_WINDOW_ID | ${jq-bin} '.[].index')
    [ -z "$space_index" ] && space_index="mouse"

    count=$(${yabai-bin} -m query --windows --space $space_index | ${jq-bin} 'map(select((."is-visible") and (."is-floating" | not))) | length')
    padding=${toString window_padding}
    [ $count -eq 1 ] && padding=0

    ${yabai-bin} -m config --space $space_index top_padding $padding
    ${yabai-bin} -m config --space $space_index bottom_padding $padding
    ${yabai-bin} -m config --space $space_index left_padding $padding
    ${yabai-bin} -m config --space $space_index right_padding $padding
    ${yabai-bin} -m config --space $space_index window_gap $padding
  '';

  script-native-tab-fix = pkgs.writeShellScript "yabai-native-tab-fix.sh" ''
    app_display=$(${yabai-bin} -m query --windows --window $YABAI_WINDOW_ID | ${jq-bin} '.display')
    [ -z "$app_display" ] && app_display=$(${yabai-bin} -m query --displays --display mouse | ${jq-bin} '.index')

    ql_windows=$(${yabai-bin} -m query --windows --display $app_display | ${jq-bin} 'map(select(.subrole == "Quick Look")) | length')

    if [ $app_display -eq 1 ]; then
      win_count=$(${yabai-bin} -m query --windows --display next | ${jq-bin} 'length')
      [ -z "$win_count" ] && win_count=0

      if [ $ql_windows -eq 0 ] && [ $win_count -gt 0 ]; then
        ${yabai-bin} -m display --focus next && yabai -m display --focus prev
      fi
    else
      win_count=$(${yabai-bin} -m query --windows --display prev | ${jq-bin} 'length')
      [ -z "$win_count" ] && win_count=0

      if [ $ql_windows -eq 0 ] && [ $win_count -gt 0 ]; then
        ${yabai-bin} -m display --focus prev && yabai -m display --focus next
      fi
    fi
  '';
in
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = false;
    package = yabai-pkg;

    config = {
      layout = "bsp";
      top_padding = window_padding;
      bottom_padding = window_padding;
      left_padding = window_padding;
      right_padding = window_padding;
      window_gap = window_padding;

      window_placement = "second_child";
      split_type = "auto";
    };

    extraConfig = (lib.strings.concatMapStrings (app: "yabai -m rule --add app='^${app}$' manage=off\n") unmanaged-apps) + ''
      # Auto-float certain windows
      yabai -m signal --add event=window_created action='
        yabai -m query --windows --window $YABAI_WINDOW_ID | ${jq-bin} -er ".\"can-resize\" or .\"is-floating\"" || \
        yabai -m window $YABAI_WINDOW_ID --toggle float
      '

      # Smart Gaps
      yabai -m signal --add event=window_created action='${script-smart-padding}'
      yabai -m signal --add event=window_destroyed action='${script-smart-padding}'
    '' + lib.strings.concatMapStrings
      # Hacky workaround for https://github.com/koekeishiya/yabai/issues/68
      (app: ''
        # Native tab handling for ${app}
        yabai -m signal --add event=window_created app="^${app}$" action='${script-native-tab-fix}'
        yabai -m signal --add event=window_destroyed app="^${app}$" action='${script-native-tab-fix}'
        yabai -m signal --add event=window_moved app="^${app}$" action='${script-native-tab-fix}'
        yabai -m signal --add event=window_resized app="^${app}$" action='${script-native-tab-fix}'
      '')
      native-tab-apps;
  };

  services.skhd.skhdConfig = ''
    alt + shift - h : ${yabai-bin} -m window --focus west
    alt + shift - j : ${yabai-bin} -m window --focus south
    alt + shift - k : ${yabai-bin} -m window --focus north
    alt + shift - l : ${yabai-bin} -m window --focus east

    alt + shift - w : ${yabai-bin} -m display --focus west
    alt + shift - e : ${yabai-bin} -m display --focus east

    alt + shift - s : ${yabai-bin} -m window --toggle split

    meh - h : ${yabai-bin} -m window --warp west
    meh - j : ${yabai-bin} -m window --warp south
    meh - k : ${yabai-bin} -m window --warp north
    meh - l : ${yabai-bin} -m window --warp east
    meh - c : ${script-cycle-clockwise}

    meh - w : ${yabai-bin} -m window --display west; ${yabai-bin} -m display --focus west
    meh - e : ${yabai-bin} -m window --display east; ${yabai-bin} -m display --focus east

    meh - f : ${yabai-bin} -m window --toggle zoom-fullscreen

    meh - t : ${yabai-bin} -m window --toggle float; ${yabai-bin} -m window --grid 6:6:1:1:4:4
    meh - m : ${yabai-bin} -m window --grid 6:6:1:1:4:4
    meh - left : ${yabai-bin} -m window --grid 1:2:0:0:1:1
    meh - down : ${yabai-bin} -m window --grid 2:2:0:1:2:1
    meh - up : ${yabai-bin} -m window --grid 2:2:0:0:2:1
    meh - right : ${yabai-bin} -m window --grid 1:2:1:0:1:1

    meh - g : ${yabai-bin} -m window --resize bottom:0:40
    meh - s : ${yabai-bin} -m window --resize bottom:0:-40

    meh - b : ${yabai-bin} -m space --balance && ${script-smart-padding}

    hyper - h : ${yabai-bin} -m window --swap west
    hyper - j : ${yabai-bin} -m window --swap south
    hyper - k : ${yabai-bin} -m window --swap north
    hyper - l : ${yabai-bin} -m window --swap east

    hyper - f : ${yabai-bin} -m window --toggle native-fullscreen
  '';
}
