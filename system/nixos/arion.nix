{ pkgs, config, secret, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation = {
    docker.enable = false;

    podman = {
      enable = true;

      defaultNetwork.settings.dns_enabled = true;

      dockerSocket.enable = true;
      dockerCompat = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    oci-containers = {
      backend = "podman";
    };

    arion = {
      backend = "podman-socket";
    };
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 53 443 ];
    allowedTCPPorts = [ 53 443 ];
  };
}
