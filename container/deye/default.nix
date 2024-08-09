{ config, ... }:

{
  virtualisation.oci-containers.containers.deye-mqtt = {
    image = "ghcr.io/kbialek/deye-inverter-mqtt:2024.07.1";
    environmentFiles = [ config.age.secrets.deye-mqtt-config.path ];
  };

  systemd.services.podman-deye-mqtt.restartTriggers = [
    "${config.age.secrets.deye-mqtt-config.file}"
  ];
}
