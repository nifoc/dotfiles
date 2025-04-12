{ pkgs, config, ... }:

{
  services.zigbee2mqtt = {
    enable = true;
    package = pkgs.zigbee2mqtt_2;

    settings = {
      serial = {
        port = "tcp://10.0.51.141:6638";
        adapter = "zstack";
        baudrate = 115200;
      };

      frontend = {
        enabled = true;
        port = 8099;
      };

      mqtt = {
        server = "mqtt://10.0.51.230:1883";
        user = "!secrets.yaml user";
        password = "!secrets.yaml password";
        base_topic = "zigbee2mqtt_garage";
      };

      advanced = {
        transmit_power = 20;
        channel = 20;
        last_seen = "ISO_8601";
      };

      homeassistant = {
        enabled = true;
        experimental_event_entities = true;
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ config.services.zigbee2mqtt.settings.frontend.port ];
  };
}
