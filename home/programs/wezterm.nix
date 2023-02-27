{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;

    package = pkgs.wezterm;

    extraConfig = ''
      _G.shells = {
        fish = '${pkgs.fish.outPath}/bin/fish',
      };

      _G.programs = {
        btop = '${pkgs.btop.outPath}/bin/btop',
      };

      local cfg = require('config');
      return cfg
    '';
  };

  xdg.configFile."wezterm" = {
    source = pkgs.runCommand "wezterm-fennel-files"
      {
        nativeBuildInputs = with pkgs; [ lua53Packages.fennel stylua ];
      } ''
      mkdir -p $out

      config_store_path="${../config/wezterm}"
      fennel="fennel --use-bit-lib --compile"

      echo "Using fennel command: $fennel"

      # Change PWD to config directory
      cd "$config_store_path"

      # Init
      echo "Compiling init.fnl ..."
      $fennel "$config_store_path/config.fnl" > "$out/config.lua"

      stylua "$out/"
    '';
    recursive = true;
  };
}
