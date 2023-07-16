{
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type file --hidden --no-ignore";
    fileWidgetCommand = "fd --type file --hidden --no-ignore";
    changeDirWidgetCommand = "fd --type directory --hidden --no-ignore";

    colors = {
      fg = "#f8f8f2";
      "fg+" = "#f8f8f2";
      bg = "#282a36";
      "bg+" = "#44475a";
      hl = "#bd93f9";
      "hl+" = "#bd93f9";

      info = "#ffb86c";
      prompt = "#50fa7b";
      pointer = "#ff79c6";
      marker = "#ff79c6";
      spinner = "#ffb86c";
      header = "#6272a4";
    };

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = false;
  };
}
