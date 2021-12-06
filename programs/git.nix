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

    delta.options = {
      theme = "Dracula";
    };
  };
}
