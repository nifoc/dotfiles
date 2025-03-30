{ config, ... }:

let
  configDir = "elixir/iex";
  fullConfigDir = "${config.xdg.configHome}/elixir/iex";
in
{
  home.sessionVariables.IEX_HOME = fullConfigDir;

  xdg.configFile."${configDir}/.iex.exs".text = # elixir
    ''
      Application.put_env(:elixir, :ansi_enabled, true)

      IEx.configure(
        colors: [enabled: true],
        auto_reload: true
      )
    '';
}
