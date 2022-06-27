{ pkgs, config, ... }:

{
  home.packages = [
    pkgs.podman
    pkgs.qemu
  ];

  xdg.configFile."containers/containers.conf.d/nix.conf".text = ''
    [engine]
      helper_binaries_dir = ["${config.home.profileDirectory}/bin"]
  '';
}
