{ pkgs, config, ... }:

let
  pkg = pkgs.jankyborders;

  borders-config = [
    "style=round"
    "active_color=0xaaabb2bf"
    "inactive_color=0xdd282a36"
    "width=5.0"
    "blur_radius=15.0"
    "hidpi=on"
    "ax_focus=on"
  ];
in
{
  environment.systemPackages = [ pkg ];

  launchd.user.agents.jankyborders = {
    serviceConfig = {
      ProgramArguments = [ "${pkg}/bin/borders" ] ++ borders-config;

      KeepAlive = true;
      RunAtLoad = true;
      ProcessType = "Interactive";
      EnvironmentVariables = {
        PATH = "${pkg}/bin:${config.environment.systemPath}";
        LANG = "en_US.UTF-8";
      };
    };
  };
}
