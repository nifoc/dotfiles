{
  den.aspects.private-device = {
    homeManager = {
      programs.git = {
        includes = [
          {
            condition = "hasconfig:remote.*.url:forgejo@git.kempkens.io:*/**";
            contents = {
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
          }

          {
            condition = "hasconfig:remote.*.url:git@github.com:*/**";
            contents = {
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
          }
        ];
      };
    };
  };
}
