{ pkgs, ... }:

let
  pkg = pkgs.rift;
  label = "com.acsandmann.rift";

  settingsFormat = pkgs.formats.toml { };

  settings = {
    settings = {
      default_disable = true;

      animate = false;
      animation_duration = 0.3;
      animation_fps = 100.0;

      focus_follows_mouse = false;
      mouse_follows_focus = false;
      mouse_hides_on_focus = false;

      layout = {
        mode = "bsp";

        gaps.outer = {
          top = 3;
          left = 3;
          bottom = 3;
          right = 3;
        };

        gaps.inner = {
          horizontal = 3;
          vertical = 3;
        };
      };
    };

    virtual_workspaces = {
      app_rules = [
        {
          app_id = "com.apple.ScreenSharing";
          floating = true;
        }
        {
          app_id = "com.apple.systempreferences";
          floating = true;
        }
        {
          app_id = "com.bitwarden.desktop";
          floating = true;
        }
        {
          app_id = "com.colliderli.iina";
          floating = true;
        }
        {
          app_id = "com.haystacksoftware.Arq";
          floating = true;
        }
        {
          app_id = "com.jonny.mona";
          floating = true;
        }
        {
          app_id = "com.kapeli.dash-setapp";
          floating = true;
        }
        {
          app_id = "com.macpaw.Gemini-setapp";
          floating = true;
        }
        {
          app_id = "com.runningwithcrayons.Alfred";
          manage = false;
        }
        {
          app_id = "com.tapbots.Ivory";
          floating = true;
        }
        {
          app_id = "net.pornel.ImageOptim";
          floating = true;
        }
      ];
    };

    modifier_combinations = {
      mod = "Ctrl + Alt + Shift";
      hyper = "Ctrl + Alt + Meta + Shift";
    };

    keys = {
      "mod + Z" = "toggle_space_activated";

      "hyper + H" = {
        move_node = "left";
      };
      "hyper + J" = {
        move_node = "down";
      };
      "hyper + K" = {
        move_node = "up";
      };
      "hyper + L" = {
        move_node = "right";
      };

      "hyper + T" = "toggle_window_floating";
      "hyper + F" = "toggle_fullscreen";
    };
  };
in
{
  home.packages = [ pkg ];

  xdg.configFile."rift/config.toml".source = settingsFormat.generate "config.toml" settings;

  launchd.agents.rift = {
    enable = true;
    config = {
      Label = label;
      ProgramArguments = [ "${pkg}/bin/rift" ];

      EnvironmentVariables = {
        PATH = "${pkg}/bin";
        RUST_LOG = "error,warn,info";
      };

      KeepAlive = {
        SuccessfulExit = false;
        Crashed = true;
      };
      RunAtLoad = true;
      LimitLoadToSessionType = "Aqua";
      ProcessType = "Interactive";
      MachServices = {
        "${label}" = true;
      };
      Nice = -20;

      StandardOutPath = "/tmp/rift.out.log";
      StandardErrorPath = "/tmp/rift.err.log";
    };
  };
}
