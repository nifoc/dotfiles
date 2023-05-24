{ pkgs, lib, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/convos 0755 root root"
  ];

  virtualisation.oci-containers.containers.convos = {
    image = "docker.io/convos/convos:stable";
    ports = [ "192.168.42.2:3000:3000" ];
    environment = {
      "CONVOS_REVERSE_PROXY" = "1";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/var/lib/convos:/data"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-convos = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      TimeoutStopSec = lib.mkForce 5;
    };
  };

  services.nginx.virtualHosts."convos.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:3000";
      proxyWebsockets = true;

      extraConfig = ''
        proxy_set_header X-Request-Base "$scheme://$host/";
      '';
    };
  };
}
