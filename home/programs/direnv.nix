{ inputs, ... }:

{
  imports = [
    inputs.direnv-instant.homeModules.direnv-instant
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      config = {
        strict_env = true;
        warn_timeout = "1m";
        hide_env_diff = true;
      };

      stdlib = builtins.readFile ../config/direnv/direnvrc;
    };

    direnv-instant.enable = true;
  };
}
