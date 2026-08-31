{ den, ... }:

{
  den.aspects.work-device = {
    homeManager =
      { config, ... }:
      {
        programs.git = {
          includes = [
            {
              condition = "hasconfig:remote.*.url:git@git.app.nedeco.de:*/**";
              contents = {
                user = {
                  name = den.aspects.${config.home.username}.meta.fullname;
                  inherit (den.aspects.${config.home.username}.meta.git.work) email;
                  signingKey = "~/.ssh/nedeco_gitlab.pub";
                };

                commit = {
                  gpgSign = true;
                };

                tag = {
                  gpgSign = true;
                };

                gpg = {
                  format = "ssh";
                };
              };
            }

            {
              condition = "hasconfig:remote.*.url:git@git.m3connect.de:*/**";
              contents = {
                user = {
                  name = den.aspects.${config.home.username}.meta.fullname;
                  inherit (den.aspects.${config.home.username}.meta.git.work) email;
                  signingKey = "~/.ssh/nedeco_gitlab.pub";
                };

                commit = {
                  gpgSign = true;
                };

                tag = {
                  gpgSign = true;
                };

                gpg = {
                  format = "ssh";
                };
              };
            }
          ];
        };
      };
  };
}
