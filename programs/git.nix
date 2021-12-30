{ config, ... }:

let
  config-work-nedeco = "${config.xdg.configHome}/git/config-work-nedeco";
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta.enable = true;

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

      diff = {
        indentheuristic = true;
        algorithm = "histogram";
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
      ".DS_Store"
    ];

    includes = [
      {
        path = "${config-work-nedeco}";
        condition = "gitdir:~/Code/Work/";
      }
    ];

    delta.options = {
      theme = "Dracula";
    };
  };

  home.file."${config-work-nedeco}".source = ../config/git/config-work-nedeco;
}
