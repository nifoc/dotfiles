{ pkgs, ... }:

{
  home.file =
    let
      scriptDirectory = "Library/Application Scripts/net.mousedown.EventScripts";
      fullScriptDirectoryPath = "$HOME/${scriptDirectory}";
      mosquitto_pub = "${pkgs.mosquitto}/bin/mosquitto_pub";
    in
    {
      "${scriptDirectory}/.hm_keyboard_connected.sh" = {
        text = ''
          #!/bin/sh

          if [ "$2" = "Keychron Q1" ]; then
            ${mosquitto_pub} -h 10.0.0.230 -m "USB-C" -t hadata/macos/daniels_monitor -u mqtt_bridge -P verySecurePassword
          fi
        '';
        onChange = ''
          rm -f "${fullScriptDirectoryPath}/keyboard_connected.sh"
          cp "${fullScriptDirectoryPath}/.hm_keyboard_connected.sh" "${fullScriptDirectoryPath}/keyboard_connected.sh"
        '';
        executable = true;
      };

      "${scriptDirectory}/.hm_keyboard_disconnected.sh" = {
        text = ''
          #!/bin/sh

          if [ "$2" = "Keychron Q1" ]; then
            ${mosquitto_pub} -h 10.0.0.230 -m "DisplayPort" -t hadata/macos/daniels_monitor -u mqtt_bridge -P verySecurePassword
          fi
        '';
        onChange = ''
          rm -f "${fullScriptDirectoryPath}/keyboard_disconnected.sh"
          cp "${fullScriptDirectoryPath}/.hm_keyboard_disconnected.sh" "${fullScriptDirectoryPath}/keyboard_disconnected.sh"
        '';
        executable = true;
      };
    };
}
