{ den, ... }:

{
  den.aspects.base = {
    nixos =
      { pkgs, ... }:
      {
        programs.git.enable = true;

        environment.systemPackages = [ pkgs.git-crypt ];
      };

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          git
          git-crypt
        ];
      };

    homeManager =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      {
        programs = {
          git = {
            enable = true;
            lfs.enable = true;

            signing = {
              format = "ssh";
            };

            settings = {
              user = {
                name = den.aspects.${config.home.username}.meta.fullname;
                inherit (den.aspects.${config.home.username}.meta.git.private) email;
              };

              alias = {
                pushf = "push --force-with-lease --force-if-includes";
                commend = "commit --amend --no-edit";
                commedit = "commit --amend";
                graph = "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative";
                rbi = "rebase --interactive --autosquash --autostash";
                rbc = "rebase --continue";
                rbabort = "rebase --abort";
              };

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
                  cmd = "${lib.getExe pkgs.nixfmt} --mergetool \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"";
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
            };

            ignores = [
              "*~"
              "*.swp"
              ".direnv/"
              ".DS_Store"
            ];

            attributes = [
              # specific
              "yarn.lock merge=yarn"
              ".gitattributes export-ignore"
              ".gitignore export-ignore"
              ".gitkeep export-ignore"
              # mergiraf
              "*.bazel merge=mergiraf"
              "*.bzl merge=mergiraf"
              "*.c merge=mergiraf"
              "*.c++ merge=mergiraf"
              "*.cc merge=mergiraf"
              "*.cmake merge=mergiraf"
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
              "*.mk merge=mergiraf"
              "*.ml merge=mergiraf"
              "*.mli merge=mergiraf"
              "*.mpp merge=mergiraf"
              "*.nix merge=mergiraf"
              "*.php merge=mergiraf"
              "*.php3 merge=mergiraf"
              "*.php4 merge=mergiraf"
              "*.php5 merge=mergiraf"
              "*.phps merge=mergiraf"
              "*.phpt merge=mergiraf"
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
              "BUILD merge=mergiraf"
              "CMakeLists.txt merge=mergiraf"
              "GNUmakefile merge=mergiraf"
              "go.mod merge=mergiraf"
              "go.sum merge=mergiraf"
              "go.work.sum merge=mergiraf"
              "Makefile merge=mergiraf"
              "pyproject.toml merge=mergiraf"
              "WORKSPACE merge=mergiraf"
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
          };

          difftastic = {
            enable = true;
            git.enable = true;
          };
        };

        home = {
          packages = with pkgs; [
            git-absorb
            git-trim
            mergiraf
          ];

          sessionVariables.GIT_CEILING_DIRECTORIES = "/Users";
        };
      };
  };
}
