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
      system_version = System.version()

      base_options = [colors: [enabled: true]]

      version_options =
        cond do
          Version.compare(system_version, "1.18.0") in [:eq, :gt] ->
            [auto_reload: true]

          true ->
            []
        end

      IEx.configure(base_options ++ version_options)
    '';
}
