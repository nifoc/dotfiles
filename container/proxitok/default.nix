{ config, ... }:

{
  virtualisation.oci-containers.containers = {
    proxitok-web = {
      image = "ghcr.io/pablouser1/proxitok:master";
      dependsOn = [ "proxitok-signer" ];
      ports = [ "127.0.0.1:8005:8080" ];
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

  systemd.services.podman-proxitok-web.restartTriggers = [
    "${config.age.secrets.proxitok-environment.file}"
  ];

  systemd.tmpfiles.rules = [
    "d /etc/container-proxitok/cache 0755 nobody nogroup"
  ];

  services.redis.servers.proxitok = {
    enable = true;
    bind = "10.88.0.1";
    port = 6381;

    databases = 1;
    save = [ ];
    appendFsync = "no";

    settings = {
      protected-mode = "no";
    };
  };

  networking.firewall.interfaces."podman+".allowedTCPPorts = [ 6381 ];

  services.nginx.virtualHosts."tictac.daniel.sx" = {
    listenAddresses = [ "100.122.253.109" "[fd7a:115c:a1e0::3a01:fd6d]" ];
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
