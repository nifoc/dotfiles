{ pkgs, ... }:

let
  wezterm-pkg = pkgs.wezterm;
  wezterm-app = "${wezterm-pkg}/Applications/WezTerm.app";
  wezterm-cli = "${wezterm-pkg}/bin/wezterm";

  yabai-bin = "${pkgs.yabai}/bin/yabai";
  jq-bin = "${pkgs.jq}/bin/jq";

  script-open-wezterm = pkgs.writeShellScript "skhd-open-wezterm.sh" ''
    if pgrep "wezterm-gui" >/dev/null 2>&1; then
      ${wezterm-cli} cli spawn
      wezterm_id="$(${yabai-bin} -m query --windows | ${jq-bin} '.[] | select(.app == "WezTerm") | .id')"
      ${yabai-bin} -m window --focus "$wezterm_id"
    else
      open ${wezterm-app}
    fi
  '';
in
{
  environment.systemPackages = [ pkgs.skhd ];

  services.skhd = {
    enable = true;

    skhdConfig = ''
      alt + shift - return : ${script-open-wezterm}
    '';
  };
}
