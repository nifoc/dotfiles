{ config, ... }:

{
  virtualisation.oci-containers.containers.adguardhome-sync = {
    image = "ghcr.io/bakito/adguardhome-sync";
    cmd = [ "run" ];
    environmentFiles = [ config.age.secrets.adguardhome-sync-environment.path ];
    extraOptions = [
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 443 ];
    allowedTCPPorts = [ 443 ];
  };
}
