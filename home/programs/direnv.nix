{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = builtins.readFile ../config/direnv/direnvrc;
  };
}
