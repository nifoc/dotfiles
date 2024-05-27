{ pkgs, config, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
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

      maintenance = mkIf isDarwin {
        strategy = "incremental";
        repo = let home = config.home.homeDirectory; in [
          "${home}/.config/nixpkgs"
        ];
      };
    };

    ignores = [
      "*~"
      "*.swp"
      ".direnv/"
      ".DS_Store"
    ];

    includes = [
      # Maintenance
      (mkIf isDarwin {
        path = "${config.xdg.configHome}/git/maintenance-config";
      })

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

  launchd.agents = mkIf isDarwin (
    let
      gitExecPath = "${config.programs.git.package}/libexec/git-core";
      git = "${gitExecPath}/git";

      calendarInterval = schedule:
        let
          freq = {
            "hourly" = [{ Minute = 0; }];
            "daily" = [{
              Hour = 0;
              Minute = 0;
            }];
            "weekly" = [{
              Weekday = 1;
              Hour = 0;
              Minute = 0;
            }];
          };
        in
        freq.${schedule};

      launchdAgent = { schedule }: {
        enable = true;
        config = {
          ProgramArguments = [
            git
            "--exec-path=${gitExecPath}"
            "for-each-repo"
            "--config=maintenance.repo"
            "maintenance"
            "run"
            "--schedule=${schedule}"
          ];
          StartCalendarInterval = calendarInterval schedule;
        };
      };
    in
    {
      git-maintenance-hourly = launchdAgent { schedule = "hourly"; };
      git-maintenance-daily = launchdAgent { schedule = "daily"; };
      git-maintenance-weekly = launchdAgent { schedule = "weekly"; };
    }
  );
}
