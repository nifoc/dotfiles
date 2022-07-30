{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arion
    pkgs.docker-client
  ];

  virtualisation.docker.enable = false;

  virtualisation.podman = {
    enable = true;

    dockerSocket.enable = true;
    defaultNetwork.dnsname.enable = true;
  };
}
