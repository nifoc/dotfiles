{ pkgs, lib, ... }:

let
  yabai-pkg = pkgs.yabai;
  yabai-bin = "${yabai-pkg}/bin/yabai";
  jq-bin = "${pkgs.jq}/bin/jq";

  window_padding = 5;

  unmanaged-apps = [
    "Dash"
    "Dato"
    "IINA"
    "LaunchBar"
    "Mona"
    "System.*einstellungen"
  ];

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
      ${yabai-bin} -m signal --add event=window_created action='
        ${yabai-bin} -m query --windows --window $YABAI_WINDOW_ID | ${jq-bin} -er ".\"can-resize\" or .\"is-floating\"" || \
        ${yabai-bin} -m window $YABAI_WINDOW_ID --toggle float
      '

      # Smart Gaps
      ${yabai-bin} -m signal --add event=window_created action='${script-smart-padding}'
      ${yabai-bin} -m signal --add event=window_destroyed action='${script-smart-padding}'
    '';
  };

  services.skhd.skhdConfig = ''
    alt + shift - h : ${yabai-bin} -m window --focus west
    alt + shift - j : ${yabai-bin} -m window --focus south
    alt + shift - k : ${yabai-bin} -m window --focus north
    alt + shift - l : ${yabai-bin} -m window --focus east

    alt + shift - w : ${yabai-bin} -m display --focus west
    alt + shift - e : ${yabai-bin} -m display --focus east

    meh - h : ${yabai-bin} -m window --warp west
    meh - j : ${yabai-bin} -m window --warp south
    meh - k : ${yabai-bin} -m window --warp north
    meh - l : ${yabai-bin} -m window --warp east

    meh - w : ${yabai-bin} -m window --display west; ${yabai-bin} -m display --focus west
    meh - e : ${yabai-bin} -m window --display east; ${yabai-bin} -m display --focus east

    meh - f : ${yabai-bin} -m window --toggle zoom-fullscreen

    meh - t : ${yabai-bin} -m window --toggle float; ${yabai-bin} -m window --grid 6:6:1:1:4:4
    meh - m : ${yabai-bin} -m window --grid 6:6:1:1:4:4
    meh - left : ${yabai-bin} -m window --grid 1:2:0:0:1:1
    meh - down : ${yabai-bin} -m window --grid 2:2:0:1:2:1
    meh - up : ${yabai-bin} -m window --grid 2:2:0:0:2:1
    meh - right : ${yabai-bin} -m window --grid 1:2:1:0:1:1
    meh - i : ${yabai-bin} -m window --grid 1:4:0:0:1:1

    meh - s : ${yabai-bin} -m window --toggle split

    meh - b : ${yabai-bin} -m space --balance && ${script-smart-padding}

    hyper - g : ${yabai-bin} -m window --resize bottom:0:40
    hyper - s : ${yabai-bin} -m window --resize bottom:0:-40

    hyper - h : ${yabai-bin} -m window --swap west
    hyper - j : ${yabai-bin} -m window --swap south
    hyper - k : ${yabai-bin} -m window --swap north
    hyper - l : ${yabai-bin} -m window --swap east

    hyper - f : ${yabai-bin} -m window --toggle native-fullscreen
  '';
}
