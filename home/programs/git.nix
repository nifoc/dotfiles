{
  pkgs,
  config,
  lib,
  ...
}:

let
  inherit (lib) mkIf optionals;
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  home.packages = with pkgs; [
    git-absorb
    git-crypt
    git-trim
    mergiraf
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
        conflictStyle = "diff3";

        mergiraf = {
          name = "mergiraf";
          driver = "${lib.getExe pkgs.mergiraf} merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
        };

        yarn = {
          name = "yarn";
          driver = "yarn install";
        };
      };

      mergetool = {
        nixfmt = {
          cmd = "${lib.getExe pkgs.nixfmt-rfc-style} --mergetool \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"";
          trustExitCode = true;
        };
      };

      rebase = {
        updateRefs = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      diff = {
        pandoc = {
          textconv = "${lib.getExe pkgs.pandoc} --to=markdown";
          prompt = false;
        };
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

    ignores = optionals (!builtins.hasAttr "nedeco" config || !config.nedeco.git.enable) [
      "*~"
      "*.swp"
      ".direnv/"
      ".DS_Store"
    ];

    attributes = optionals (!builtins.hasAttr "nedeco" config || !config.nedeco.git.enable) [
      # specific
      "yarn.lock merge=yarn"
      ".gitattributes export-ignore"
      ".gitignore export-ignore"
      ".gitkeep export-ignore"
      # mergiraf
      "*.c merge=mergiraf"
      "*.c++ merge=mergiraf"
      "*.cc merge=mergiraf"
      "*.cpp merge=mergiraf"
      "*.cppm merge=mergiraf"
      "*.cs merge=mergiraf"
      "*.cxx merge=mergiraf"
      "*.dart merge=mergiraf"
      "*.dts merge=mergiraf"
      "*.ex merge=mergiraf"
      "*.exs merge=mergiraf"
      "*.go merge=mergiraf"
      "*.h merge=mergiraf"
      "*.h++ merge=mergiraf"
      "*.hcl merge=mergiraf"
      "*.hh merge=mergiraf"
      "*.hpp merge=mergiraf"
      "*.hs merge=mergiraf"
      "*.htm merge=mergiraf"
      "*.html merge=mergiraf"
      "*.hxx merge=mergiraf"
      "*.ini merge=mergiraf"
      "*.ixx merge=mergiraf"
      "*.java merge=mergiraf"
      "*.js merge=mergiraf"
      "*.json merge=mergiraf"
      "*.jsx merge=mergiraf"
      "*.kt merge=mergiraf"
      "*.lua merge=mergiraf"
      "*.md merge=mergiraf"
      "*.mjs merge=mergiraf"
      "*.ml merge=mergiraf"
      "*.mli merge=mergiraf"
      "*.mpp merge=mergiraf"
      "*.nix merge=mergiraf"
      "*.php merge=mergiraf"
      "*.phtml merge=mergiraf"
      "*.properties merge=mergiraf"
      "*.py merge=mergiraf"
      "*.rb merge=mergiraf"
      "*.rs merge=mergiraf"
      "*.sbt merge=mergiraf"
      "*.scala merge=mergiraf"
      "*.sol merge=mergiraf"
      "*.sv merge=mergiraf"
      "*.svh merge=mergiraf"
      "*.tcc merge=mergiraf"
      "*.tf merge=mergiraf"
      "*.tfvars merge=mergiraf"
      "*.toml merge=mergiraf"
      "*.ts merge=mergiraf"
      "*.tsx merge=mergiraf"
      "*.xhtml merge=mergiraf"
      "*.xml merge=mergiraf"
      "*.yaml merge=mergiraf"
      "*.yml merge=mergiraf"
      "go.mod merge=mergiraf"
      "go.sum merge=mergiraf"
      # pandoc
      "*.docx diff=pandoc"
      "*.epub diff=pandoc"
      "*.odt diff=pandoc"
      # other
      "*.age binary"
      "*.bat eol=crlf"
      "*.cmd eol=crlf"
      "*.ps1 eol=crlf"
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
