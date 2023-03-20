{ pkgs, config, ... }:

{
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
        flags = [ "--all" ];
      };
    };

    oci-containers = {
      backend = "podman";
    };
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 53 ];
    allowedTCPPorts = [ 53 ];
  };
}