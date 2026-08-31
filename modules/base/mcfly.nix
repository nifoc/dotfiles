{
  den.aspects.base = {
    homeManager =
      { lib, ... }:
      {
        programs = {
          mcfly = {
            enable = true;
            fzf.enable = true;

            keyScheme = "vim";
          };

          zsh.initContent =
            lib.mkOrder 1502 # sh
              ''
                bindkey '^[[A' mcfly-fzf-history-widget
                bindkey '^[OA' mcfly-fzf-history-widget
              '';
        };

        home.sessionVariables.MCFLY_RESULTS_SORT = "LAST_RUN";
      };
  };
}
