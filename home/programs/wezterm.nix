{ pkgs, config, ... }:

let
  wezterm-pkg = pkgs.wezterm;

  wezterm-nushell = pkgs.writeShellScript "wezterm-nushell.sh" ''
    source /etc/static/bashrc
    source ${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh

    exec ${pkgs.nushell.outPath}/bin/nu
  '';
in
{
  programs.wezterm = {
    enable = true;

    package = wezterm-pkg;

    extraConfig = ''
      _G.shells = {
        bash = '${pkgs.bash.outPath}/bin/bash',
        fish = '${pkgs.fish.outPath}/bin/fish',
        nushell = '${wezterm-nushell}',
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
