{ lib, ... }:

{
  virtualisation.oci-containers.containers.prowlarr = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    ports = [ "192.168.42.2:9696:9696" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/var/lib/prowlarr:/config"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-prowlarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];
  };

  services.nginx.virtualHosts."prowlarr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:9696";
      proxyWebsockets = true;
    };
  };
}
