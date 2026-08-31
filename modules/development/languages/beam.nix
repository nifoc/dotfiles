{
  den.aspects.development = {
    homeManager =
      { config, lib, ... }:
      let
        configDir = "elixir/iex";
      in
      {
        home.sessionVariables.IEX_HOME = "${config.xdg.configHome}/${configDir}";

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

        programs.direnv.stdlib =
          lib.mkOrder 5100 # sh
            ''
              project_erlang() {
                export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_path '\"$(direnv_layout_dir)/erl_history\"'"

                export REBAR_CACHE_DIR=$(direnv_layout_dir)/rebar
                export REBAR_GLOBAL_CONFIG_DIR=$(direnv_layout_dir)/rebar/config
                export REBAR_GLOBAL_CACHE_DIR=$(direnv_layout_dir)/rebar/cache
              }

              project_elixir() {
                project_erlang

                export MIX_HOME=$(direnv_layout_dir)/mix
                export HEX_HOME=$(direnv_layout_dir)/hex

                PATH_add $MIX_HOME/bin
                PATH_add $HEX_HOME/bin
              }

              project_phoenix() {
                project_elixir
                project_node
              }
            '';
      };
  };
}
