{ lib, ... }:

{
  virtualisation.oci-containers.containers.flaresolverr = {
    image = "ghcr.io/flaresolverr/flaresolverr:latest";
    ports = [ "192.168.42.2:8191:8191" ];
    environment = {
      "TZ" = "Etc/UTC";
      "HOST" = "192.168.42.2";
      "PORT" = "8191";
    };
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-flaresolverr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];
  };
}
