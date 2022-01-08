{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = ''
      project() {
        local cmd=$1
        log_status "project $*"
        shift
        "project_$cmd" "$@"
      }

      # Languages

      project_ruby() {
        export GEM_HOME=$(direnv_layout_dir)/gem
        export BUNDLE_USER_HOME=$(direnv_layout_dir)/bundle

        PATH_add $GEM_HOME/bin
      }

      project_node() {
        export NODE_PATH=$(direnv_layout_dir)/node
        export NPM_CONFIG_PREFIX=$(direnv_layout_dir)/npm/config
        export NPM_CONFIG_CACHE=$(direnv_layout_dir)/npm/cache

        PATH_add $NODE_PATH/bin
        PATH_add node_modules/.bin
      }

      # Frameworks

      project_rails() {
        project_ruby()
        project_node()
      }
    '';
  };
}
