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
      commend = "commit --amend --no-edit";
      commedit = "commit --amend";
      graph = "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative";
      rbi = "rebase --interactive --autosquash --autostash";
      rbc = "rebase --continue";
      rbabort = "rebase --abort";
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

      branch = {
        sort = "-committerdate";
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

      init = {
        defaultBranch = "master";
      };

      color = {
        ui = "auto";
      };

      column = {
        ui = "auto";
      };

      apply = {
        whitespace = "fix";
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
