{ pkgs, ... }:

let
  yabai-pkg = pkgs.yabai;
  yabai-bin = "${yabai-pkg}/bin/yabai";
  jq-bin = "${pkgs.jq}/bin/jq";

  script-cycle-clockwise = pkgs.writeShellScript "yabai-cycle-clockwise.sh" ''
    win=$(${yabai-bin} -m query --windows --window last | ${jq-bin} '.id')

    while : ; do
      ${yabai-bin} -m window $win --swap prev &> /dev/null
      if [[ $? -eq 1 ]]; then
        break
      fi
    done
  '';
in
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = false;
    package = yabai-pkg;

    config = {
      layout = "bsp";
      top_padding = 5;
      bottom_padding = 5;
      left_padding = 5;
      right_padding = 5;
      window_gap = 5;

      window_placement = "second_child";
      split_type = "auto";
    };

    extraConfig = ''
      yabai -m rule --add app='^Dato$' manage=off
      yabai -m rule --add app='^Mona$' manage=off
      yabai -m rule --add app='^System.*einstellungen$' manage=off

      yabai -m signal --add event=window_created action='
        yabai -m query --windows --window $YABAI_WINDOW_ID | ${jq-bin} -er ".\"can-resize\" or .\"is-floating\"" || \
        yabai -m window $YABAI_WINDOW_ID --toggle float
      '
    '';
  };

  services.skhd.skhdConfig = ''
    alt + shift - h : ${yabai-bin} -m window --focus west
    alt + shift - j : ${yabai-bin} -m window --focus south
    alt + shift - k : ${yabai-bin} -m window --focus north
    alt + shift - l : ${yabai-bin} -m window --focus east

    alt + shift - w : ${yabai-bin} -m display --focus west
    alt + shift - e : ${yabai-bin} -m display --focus east

    meh - h : ${yabai-bin} -m window --swap west
    meh - j : ${yabai-bin} -m window --swap south
    meh - k : ${yabai-bin} -m window --swap north
    meh - l : ${yabai-bin} -m window --swap east
    meh - c : ${script-cycle-clockwise}

    meh - w : ${yabai-bin} -m window --display west; ${yabai-bin} -m display --focus west
    meh - e : ${yabai-bin} -m window --display east; ${yabai-bin} -m display --focus east

    meh - f : ${yabai-bin} -m window --toggle zoom-fullscreen

    meh - t : ${yabai-bin} -m window --toggle float; ${yabai-bin} -m window --grid 6:6:1:1:4:4

    meh - g : ${yabai-bin} -m window --resize bottom:0:40
    meh - s : ${yabai-bin} -m window --resize bottom:0:-40

    hyper - h : ${yabai-bin} -m window --warp west
    hyper - j : ${yabai-bin} -m window --warp south
    hyper - k : ${yabai-bin} -m window --warp north
    hyper - l : ${yabai-bin} -m window --warp east

    hyper - f : ${yabai-bin} -m window --toggle native-fullscreen
  '';
}
