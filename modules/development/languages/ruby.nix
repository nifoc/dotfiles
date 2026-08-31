{
  den.aspects.development = {
    homeManager =
      { lib, ... }:
      {
        programs.direnv.stdlib =
          lib.mkOrder 5100 # sh
            ''
              project_ruby() {
                export GEM_HOME=$(direnv_layout_dir)/gem
                export BUNDLE_USER_HOME=$(direnv_layout_dir)/bundle

                PATH_add $GEM_HOME/bin
              }

              project_rails() {
                project_ruby
                project_node
              }
            '';
      };
  };
}
