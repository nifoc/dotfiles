{ pkgs, config, secret, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation = {
    docker.enable = false;

    podman = {
      enable = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    containers.containersConf.cniPlugins = with pkgs; [
      cni-plugins
      dnsname-cni
    ];

    oci-containers.backend = "podman";

    arion = {
      backend = "podman-socket";
    };
  };
}
