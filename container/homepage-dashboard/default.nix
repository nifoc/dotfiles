{ lib, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/homepage-dashboard 0755 media_user media_group"
  ];

  virtualisation.oci-containers.containers.homepage-dashboard = {
    image = "ghcr.io/benphelps/homepage:latest";
    ports = [ "127.0.0.1:9888:3000" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
    };
    volumes = [
      "/var/lib/homepage-dashboard:/app/config"
    ];
  };

  systemd.services.podman-homepage-dashboard.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 443 9920 ];
    allowedTCPPorts = [ 443 9920 ];
  };

  services.nginx.virtualHosts."homepage.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:9888";
    };
  };
}
