{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git-absorb
    git-crypt
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    difftastic = {
      enable = true;
    };

    userName = "Daniel Kempkens";
    userEmail = "daniel+git@kempkens.io";

    aliases = {
      pushf = "push --force-with-lease --force-if-includes";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        whitespace = "trailing-space,space-before-tab";
        autocrlf = "input";
      };

      pull = {
        rebase = true;
      };

      push = {
        default = "simple";
      };

      apply = {
        whitespace = "fix";
      };

      merge = {
        conflictStyle = "zdiff3";
      };

      rebase = {
        updateRefs = true;
      };

      rerere = {
        enabled = true;
      };

      branch = {
        sort = "-committerdate";
      };

      color = {
        ui = "auto";
      };

      column = {
        ui = "auto";
      };
    };

    ignores = [
      "*~"
      "*.swp"
      ".direnv/"
      ".DS_Store"
    ];

    includes = [
      # Private
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

      # Work
      {
        condition = "hasconfig:remote.*.url:git@git.app.nedeco.de:*/**";
        contents = {
          user = {
            email = "d.kempkens@nedeco.de";
            name = "Daniel Kempkens";
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

          "gpg \"ssh\"" = {
            allowedSignersFile = "~/.ssh/allowed_signers/work-nedeco";
          };
        };
      }
    ];
  };

  home.sessionVariables.GIT_CEILING_DIRECTORIES = "/Users";
}
