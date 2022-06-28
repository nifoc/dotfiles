{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    podman
    qemu
    skopeo
  ];

  xdg.configFile."containers/containers.conf.d/nix.conf".text = ''
    [engine]
      helper_binaries_dir = ["${config.home.profileDirectory}/bin"]
  '';
}
