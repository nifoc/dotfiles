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

    containers.containersConf.cniPlugins = [
      pkgs.cniPlugins.dnsname
    ];

    oci-containers.backend = "podman";

    arion = {
      backend = "podman-socket";
    };
  };
}
