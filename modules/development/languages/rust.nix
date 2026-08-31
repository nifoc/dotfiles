{
  den.aspects.development = {
    homeManager =
      { lib, ... }:
      {
        programs.direnv.stdlib =
          lib.mkOrder 5100 # sh
            ''
              project_rust() {
                export CARGO_HOME=$(direnv_layout_dir)/cargo

                PATH_add $CARGO_HOME/bin
              }

              project_tauri() {
                project_rust
                project_node
              }
            '';
      };
  };
}
