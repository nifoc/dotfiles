let
  direnvrc = ../config/direnv/direnvrc;
in
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    stdlib = direnvrc;
  };
}
