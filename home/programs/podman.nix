{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    podman
    podman-compose
    qemu
    gvproxy
    skopeo
  ];

  xdg.configFile."containers/containers.conf.d/nix.conf".text = ''
    [engine]
      helper_binaries_dir = ["${config.home.profileDirectory}/bin"]
  '';

  programs.fish.functions.podman = /* fish */ ''
    fish -c "set -e SSH_AUTH_SOCK; ${config.home.profileDirectory}/bin/podman $argv"
  '';
}
