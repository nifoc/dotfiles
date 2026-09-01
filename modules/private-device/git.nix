{
  den.aspects.private-device = {
    homeManager = {
      programs.git =
        let
          privateConfig = {
            user = {
              signingKey = "~/.ssh/GitHub.pub";
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
        in
        {
          includes = [
            {
              condition = "hasconfig:remote.*.url:forgejo@git.kempkens.io:*/**";
              contents = privateConfig;
            }

            {
              condition = "hasconfig:remote.*.url:ssh://forgejo@git.kempkens.io/**";
              contents = privateConfig;
            }

            {
              condition = "hasconfig:remote.*.url:git@github.com:*/**";
              contents = privateConfig;
            }
          ];
        };
    };
  };
}
