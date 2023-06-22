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

  systemd.tmpfiles.rules = [
    "d /etc/container-proxitok/cache 0755 33 33"
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

  systemd.services.redis-proxitok.after = [ "podman-wait-for-host-interface.service" ];

  networking.firewall.interfaces."podman+".allowedTCPPorts = [ 6381 ];

  services.nginx.virtualHosts."tictac.daniel.sx" = {
    listenAddresses = [ "100.108.165.26" "[fd7a:115c:a1e0:ab12:4843:cd96:626c:a51a]" ];
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
