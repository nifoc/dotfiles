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

      iex_options = [colors: [enabled: true]]

      iex_options =
        if Version.compare(System.version(), "1.18.0") in [:eq, :gt] do
          iex_options ++ [auto_reload: true]
        else
          iex_options
        end

      IEx.configure(iex_options)
    '';
}
