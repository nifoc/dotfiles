{
  pkgs,
  config,
  lib,
  ...
}:

let
  pkg = pkgs.rift;
  label = "com.acsandmann.rift";

  settingsFormat = pkgs.formats.toml { };

  settings = rec {
    settings = {
      hot_reload = false;
      default_disable = false;

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

      ui = {
        menu_bar.enabled = false;
        stack_line.enabled = false;
        mission_control.enabled = true;
      };
    };

    virtual_workspaces = rec {
      enabled = true;
      default_workspace_count = builtins.length workspace_names;
      auto_assign_windows = true;
      preserve_focus_per_workspace = true;
      workspace_auto_back_and_forth = false;
      reapply_app_rules_on_title_change = false;

      workspace_names = [
        "Main"
        "Communication"
        "Screen Share"
      ];

      app_rules =
        let
          floating_ids = [
            "com.bitwarden.desktop"
            "com.colliderli.iina"
            "com.haystacksoftware.Arq"
            "com.kapeli.dash-setapp"
            "com.macpaw.Gemini-setapp"
            "com.noodlesoft.Hazel"
            "net.pornel.ImageOptim"
          ];

          unmanaged_ids = [
            "com.apple.systempreferences"
            "com.jonny.supermona"
            "com.tapbots.Ivory"
          ];

          communication_ids = [
            "com.apple.mail"
            "ch.protonmail.desktop"
            "com.apple.MobileSMS"
          ];

          screen_share_ids = [
            "com.apple.ScreenSharing"
            "com.edovia.screens.5"
          ];
        in
        (map (id: {
          app_id = id;
          floating = true;
        }) floating_ids)
        ++ (map (id: {
          app_id = id;
          manage = false;
        }) unmanaged_ids)
        ++ (map (id: {
          app_id = id;
          workspace = lib.lists.findFirstIndex (w: w == "Communication") 0 workspace_names;
        }) communication_ids)
        ++ (map (id: {
          app_id = id;
          workspace = lib.lists.findFirstIndex (w: w == "Screen Share") 0 workspace_names;
        }) screen_share_ids)
        ++ [
          {
            app_id = "com.apple.finder";
            title_substring = "Kopieren";
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

      "mod + H" = {
        move_focus = "left";
      };
      "mod + J" = {
        move_focus = "down";
      };
      "mod + K" = {
        move_focus = "up";
      };
      "mod + L" = {
        move_focus = "right";
      };

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

      "hyper + W" = {
        move_window_to_display = {
          selector = "left";
        };
      };
      "hyper + E" = {
        move_window_to_display = {
          selector = "right";
        };
      };

      "hyper + T" = "toggle_window_floating";
      "hyper + F" = "toggle_fullscreen";

      "mod + M" = "dismiss_mission_control";
      "hyper + M" = "show_mission_control_current";
      "hyper + C" = "show_mission_control_all";

      "mod + 1" = {
        set_workspace_layout = {
          mode = "bsp";
        };
      };
      "mod + 2" = {
        set_workspace_layout = {
          mode = "traditional";
        };
      };
    }
    // (builtins.listToAttrs (
      builtins.concatMap (i: [
        {
          name = "hyper + ${toString i}";
          value = {
            switch_to_workspace = i - 1;
          };
        }
      ]) (lib.lists.range 1 (builtins.length virtual_workspaces.workspace_names))
    ));
  };

  settingsFile = settingsFormat.generate "config.toml" settings;
in
{
  home.packages = [ pkg ];

  launchd.agents.rift = {
    enable = true;
    config = {
      Label = label;
      ProgramArguments = [
        "${pkg}/bin/rift"
        "--config"
        "${settingsFile}"
      ];

      EnvironmentVariables = {
        PATH = "${config.home.profileDirectory}/bin";
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
