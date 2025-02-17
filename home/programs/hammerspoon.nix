{ pkgs, lib, config, ... }:

{
  xdg.configFile."hammerspoon" =
    let
      programs = /* lua */ ''
        local M = {
          mosquitto_pub = \"${pkgs.mosquitto}/bin/mosquitto_pub\",
        }

        return M
      '';
    in
    {
      source = pkgs.runCommand "hammerspoon-fennel-files"
        {
          nativeBuildInputs = with pkgs; [ lua54Packages.fennel ];
        } ''
        mkdir -p $out

        config_store_path="${../config/hammerspoon}"
        fennel="fennel --use-bit-lib --compile"

        echo "Using fennel command: $fennel"

        # Change PWD to config directory
        cd "$config_store_path"

        echo "Writing programs.lua ..."
        echo "${programs}" > "$out/programs.lua"

        # Config
        echo "Compiling init.fnl ..."
        $fennel "$config_store_path/init.fnl" > "$out/init.lua"
      '';
      recursive = true;
    };

  home = {
    file =
      let
        spoons-directory = "${config.xdg.configHome}/hammerspoon/Spoons";
      in
      {
        "${spoons-directory}/Caffeine.spoon".source = pkgs.fetchzip {
          url = "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Caffeine.spoon.zip";
          sha256 = "sha256-Q7i2O0vKKntJ/NIBRAeP0OXu3wIfN29LDisGxWtxQqI=";
        };

        "${spoons-directory}/USBDeviceActions.spoon".source = pkgs.fetchzip {
          url = "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/USBDeviceActions.spoon.zip";
          sha256 = "sha256-/h2axBWbzbtKjXo2mjp18dP4EV42cKqHhDMq4RhOec4=";
        };
      };

    activation.hammerspoonReload = lib.hm.dag.entryAfter [ "writeBoundary" ] /* bash */ ''
      $VERBOSE_ECHO "Reloading Hammerspoon configuration"

      $DRY_RUN_CMD /Applications/Hammerspoon.app/Contents/Frameworks/hs/hs -c 'hs.reload()' || true
    '';
  };
}
