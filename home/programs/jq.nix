{
  programs.jq = {
    enable = true;

    colors = {
      null = "1;32";
      false = "1;35";
      true = "1;35";
      numbers = "0;35";
      strings = "0;33";
      arrays = "1;37";
      objects = "1;37";
      objectKeys = "1;34";
    };
  };
}
