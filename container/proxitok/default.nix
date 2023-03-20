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

  # The proxitok-signer container doesn't play nicely with SIGTERM
  systemd.services.podman-proxitok-signer.serviceConfig = {
    TimeoutStopSec = lib.mkForce 2;
  };

  systemd.tmpfiles.rules = [
    "d /etc/container-proxitok/cache 0755 33 33"
  ];

  services.nginx.virtualHosts."tictac.daniel.sx" = {
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";
    basicAuthFile = config.age.secrets.proxitok-auth.path;

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8005";
    };
  };
}
