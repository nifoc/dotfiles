{ lib, config, ... }:

let
  data-dir = "/var/lib/recyclarr";
in
{
  virtualisation.oci-containers.containers.recyclarr = {
    image = "ghcr.io/recyclarr/recyclarr:latest";
    environment = {
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "${data-dir}:/config"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-recyclarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    restartTriggers = [ "${config.age.secrets.recyclarr-config.file}" ];
  };

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 1000 1000"
  ];
}
