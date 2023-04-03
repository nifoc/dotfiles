{ config, lib, ... }:

{
  virtualisation.oci-containers.containers = {
    proxitok-web = {
      image = "ghcr.io/pablouser1/proxitok:master";
      dependsOn = [ "proxitok-signer" ];
      ports = [ "127.0.0.1:8005:80" ];
      environmentFiles = [ config.age.secrets.proxitok-environment.path ];
      volumes = [
        "/etc/container-proxitok/cache:/cache"
      ];
      extraOptions = [
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    proxitok-signer = {
      image = "ghcr.io/pablouser1/signtok:master";
      extraOptions = [
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };
  };

  systemd.services.podman-proxitok-web.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  systemd.services.podman-proxitok-signer.serviceConfig = {
    TimeoutStopSec = lib.mkForce 5;
  };

  systemd.tmpfiles.rules = [
    "d /etc/container-proxitok/cache 0755 33 33"
  ];

  services.nginx.virtualHosts."tictac.daniel.sx" = {
    listenAddresses = [ "100.113.242.85" "[fd7a:115c:a1e0:ab12:4843:cd96:6271:f255]" ];
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8005";
    };
  };
}
