{ config, ... }:

let
  config-work-nedeco = "${config.xdg.configHome}/git/config-work-nedeco";
  config-work-wdw = "${config.xdg.configHome}/git/config-work-wdw";
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    difftastic = {
      enable = true;
    };

    userName = "Daniel Kempkens";
    userEmail = "daniel+git@kempkens.io";

    aliases = {
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

      rerere = {
        enabled = true;
      };

      color = {
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
      {
        path = "${config-work-nedeco}";
        condition = "gitdir:~/Code/Work/";
      }

      {
        path = "${config-work-wdw}";
        condition = "gitdir:~/Code/Work/WDW/";
      }
    ];
  };

  home.sessionVariables.GIT_CEILING_DIRECTORIES = "/Users";

  home.file."${config-work-nedeco}".source = ../config/git/config-work-nedeco;
  home.file."${config-work-wdw}".source = ../config/git/config-work-wdw;
}
