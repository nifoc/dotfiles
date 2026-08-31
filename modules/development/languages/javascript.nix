{
  den.aspects.development = {
    homeManager =
      { lib, ... }:
      {
        programs.direnv.stdlib =
          lib.mkOrder 5000 # sh
            ''
              project_node() {
                export NODE_PATH=$(direnv_layout_dir)/node
                export NPM_CONFIG_USERCONFIG=$(direnv_layout_dir)/npm/npmrc
                export NPM_CONFIG_PREFIX=$(direnv_layout_dir)/npm/config
                export NPM_CONFIG_CACHE=$(direnv_layout_dir)/npm/cache
                export NPM_CONFIG_DEVDIR=$(direnv_layout_dir)/npm/dev

                export YARN_ENABLE_TELEMETRY=false
                export NEXT_TELEMETRY_DISABLED=1

                PATH_add $NODE_PATH/bin
                PATH_add node_modules/.bin
              }
            '';
      };
  };
}
