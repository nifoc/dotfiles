{
  den.aspects.development = {
    homeManager =
      { lib, ... }:
      {
        programs.direnv.stdlib =
          lib.mkOrder 5000 # sh
            ''
              project_java() {
                export M2_HOME=$(direnv_layout_dir)/m2

                export GRADLE_HOME=$(direnv_layout_dir)/gradle

                PATH_add $GRADLE_HOME/bin
              }
            '';
      };
  };
}
