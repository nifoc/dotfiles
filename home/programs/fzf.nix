{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type file --hidden --no-ignore";
    fileWidgetCommand = "fd --type file --hidden --no-ignore";
    changeDirWidgetCommand = "fd --type directory --hidden --no-ignore";

    colors = {
      fg = "-1";
      "fg+" = "-1";
      bg = "-1";
      "bg+" = "-1";
      hl = "#5fff87";
      "hl+" = "#ffaf5f";

      info = "#af87ff";
      prompt = "#5fff87";
      pointer = "#ff87d7";
      marker = "#ff87d7";
      spinner = "#ff87d7";
    };

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = false;
  };
}
