{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  home.packages = with pkgs; [
    git-absorb
    git-crypt
    git-trim
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
        autoSetupRemote = true;
        followTags = true;
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      branch = {
        sort = "-committerdate";
      };

      tag = {
        sort = "version:refname";
      };

      merge = {
        conflictStyle = "zdiff3";
      };

      "merge \"mergiraf\"" = {
        name = "mergiraf";
        driver = "${lib.getExe pkgs.mergiraf} merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
      };

      rebase = {
        updateRefs = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
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

      help = {
        autocorrect = "prompt";
      };

      apply = {
        whitespace = "fix";
      };

      maintenance = mkIf isDarwin {
        strategy = "incremental";
        repo =
          let
            home = config.home.homeDirectory;
          in
          [
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

    attributes = [
      "*.java merge=mergiraf"
      "*.kt merge=mergiraf"
      "*.rs merge=mergiraf"
      "*.go merge=mergiraf"
      "*.js merge=mergiraf"
      "*.jsx merge=mergiraf"
      "*.mjs merge=mergiraf"
      "*.json merge=mergiraf"
      "*.yml merge=mergiraf"
      "*.yaml merge=mergiraf"
      "*.toml merge=mergiraf"
      "*.html merge=mergiraf"
      "*.htm merge=mergiraf"
      "*.xhtml merge=mergiraf"
      "*.xml merge=mergiraf"
      "*.c merge=mergiraf"
      "*.h merge=mergiraf"
      "*.cc merge=mergiraf"
      "*.cpp merge=mergiraf"
      "*.hpp merge=mergiraf"
      "*.cs merge=mergiraf"
      "*.dart merge=mergiraf"
      "*.dts merge=mergiraf"
      "*.scala merge=mergiraf"
      "*.sbt merge=mergiraf"
      "*.ts merge=mergiraf"
      "*.tsx merge=mergiraf"
      "*.py merge=mergiraf"
      "*.php merge=mergiraf"
      "*.phtml merge=mergiraf"
      "*.sol merge=mergiraf"
      "*.lua merge=mergiraf"
      "*.rb merge=mergiraf"
      "*.nix merge=mergiraf"
      "*.sv merge=mergiraf"
      "*.svh merge=mergiraf"
    ];

    includes =
      let
        op-ssh-sign = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      in
      [
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

            "gpg \"ssh\"" = {
              program = op-ssh-sign;
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

            "gpg \"ssh\"" = {
              program = op-ssh-sign;
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
              program = op-ssh-sign;
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

      calendarInterval =
        schedule:
        let
          freq = {
            "hourly" = [ { Minute = 0; } ];
            "daily" = [
              {
                Hour = 0;
                Minute = 0;
              }
            ];
            "weekly" = [
              {
                Weekday = 1;
                Hour = 0;
                Minute = 0;
              }
            ];
          };
        in
        freq.${schedule};

      launchdAgent =
        { schedule }:
        {
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
