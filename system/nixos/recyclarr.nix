{ lib, config, ... }:

let
  data-dir = "/var/lib/recyclarr";
  netns = "dl";
in
{
  virtualisation.oci-containers.containers.recyclarr = {
    image = "ghcr.io/recyclarr/recyclarr:latest";
    dependsOn = [ "sonarr" ];
    environment = {
      "TZ" = "Etc/UTC";
    };
    volumes = [ "${data-dir}:/config" ];
    networks = [ "ns:/var/run/netns/${netns}" ];
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd.services.podman-recyclarr = {
    bindsTo = [ "wg-${netns}.service" ];
    after = lib.mkAfter [ "wg-${netns}.service" ];

    restartTriggers = [ "${config.age.secrets.recyclarr-config.file}" ];
  };

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 1000 1000"
  ];
}
