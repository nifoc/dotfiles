{ config, ... }:

let
  inherit (config.virtualisation.quadlet) containers;

  data-dir = "/var/lib/recyclarr";
  netns = "dl";
in
{
  virtualisation.quadlet.containers.recyclarr = {
    containerConfig = {
      image = "ghcr.io/recyclarr/recyclarr:latest";
      environments = {
        "TZ" = "Etc/UTC";
      };
      volumes = [ "${data-dir}:/config" ];
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      Requires = [ containers.sonarr.ref ];
      After = [
        containers.sonarr.ref
        "wg-${netns}.service"
      ];
    };
  };

  # services.recyclarr = {
  #   restartTriggers = lib.mkDefault [ "${config.age.secrets.recyclarr-config.file}" ];
  # };

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 1000 1000"
  ];
}
