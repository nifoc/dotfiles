{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  virtualisation.arion = {
    backend = "docker";
  };
}
