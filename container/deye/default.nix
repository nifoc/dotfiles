{ config, ... }:

{
  virtualisation.oci-containers.containers.deye-mqtt = {
    image = "ghcr.io/kbialek/deye-inverter-mqtt:2024.07.1";
    environmentFiles = [ config.age.secrets.deye-mqtt-config.path ];
  };

  systemd.services.podman-deye-mqtt.restartTriggers = [
    "${config.age.secrets.deye-mqtt-config.file}"
  ];

  services.mosquitto.listeners = [
    {
      address = "0.0.0.0";
      port = 1884;

      settings = {
        protocol = "mqtt";
      };

      users = {
        deye = {
          password = "didYouFindThis";
          acl = [ "write deye/#" ];
        };

        bitshake = {
          password = "didYouFindThis";
          acl = [ "write bitshake/#" ];
        };

        weewx-proxy = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx-proxy.path;
          acl = [ "read deye/#" "read bitshake/#" ];
        };
      };
    }
  ];

  networking.firewall.interfaces =
    let
      mosquittoPorts = [ 1884 ];
    in
    {
      "end0".allowedTCPPorts = mosquittoPorts;
      "vlan51".allowedTCPPorts = mosquittoPorts;
      "podman+".allowedTCPPorts = mosquittoPorts;
    };
}
