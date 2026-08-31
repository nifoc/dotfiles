{
  den.aspects.development = {
    homeManager =
      { lib, ... }:
      {
        programs.direnv.stdlib =
          lib.mkOrder 5000 # sh
            ''
              project_python() {
                export PYTHONUSERBASE=$(direnv_layout_dir)/python-user
                path_add PYTHONPATH $(realpath $PYTHONUSERBASE/lib/python*/site-packages)

                export POETRY_HOME=$(direnv_layout_dir)/poetry/data
                export POETRY_CACHE_DIR=$(direnv_layout_dir)/poetry/cache

                PATH_add $PYTHONUSERBASE/bin
              }
            '';
      };
  };
}
