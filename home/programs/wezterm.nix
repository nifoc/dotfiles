{ pkgs, ... }:

let
  wezterm-pkg = pkgs.wezterm;
in
{
  programs.wezterm = {
    enable = true;
    package = wezterm-pkg;

    extraConfig = /* lua */ ''
      _G.shells = {
        bash = '${pkgs.bash.outPath}/bin/bash',
        zsh = '${pkgs.zsh.outPath}/bin/zsh',
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
        nativeBuildInputs = with pkgs; [ lua53Packages.fennel ];
      } ''
      mkdir -p $out

      config_store_path="${../config/wezterm}"
      fennel="fennel --use-bit-lib --compile"

      echo "Using fennel command: $fennel"

      # Change PWD to config directory
      cd "$config_store_path"

      # Config
      echo "Compiling config.fnl ..."
      $fennel "$config_store_path/config.fnl" > "$out/config.lua"
    '';
    recursive = true;
  };
}
