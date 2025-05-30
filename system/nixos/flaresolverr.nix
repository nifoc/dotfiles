{ lib, ... }:

let
  netns = "dl";
in
{
  virtualisation.oci-containers.containers.flaresolverr = {
    image = "ghcr.io/flaresolverr/flaresolverr:latest";
    ports = [ "192.168.42.2:8191:8191" ];
    environment = {
      "TZ" = "Etc/UTC";
      "HOST" = "192.168.42.2";
      "PORT" = "8191";
    };
    networks = [ "ns:/var/run/netns/${netns}" ];
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd.services.podman-flaresolverr = {
    bindsTo = [ "wg-${netns}.service" ];
    after = lib.mkAfter [ "wg-${netns}.service" ];
  };
}
