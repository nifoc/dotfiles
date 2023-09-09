{
  programs.zoxide = {
    enable = true;
  };

  programs.fish.shellAliases = {
    j = "z";
    ji = "zi";
  };

  programs.nushell.shellAliases = {
    j = "z";
    ji = "zi";
  };
}
