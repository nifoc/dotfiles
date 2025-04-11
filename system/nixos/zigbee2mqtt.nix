{ pkgs, ... }:

{
  services.zigbee2mqtt = {
    enable = true;
    package = pkgs.zigbee2mqtt_2;

    settings = { };
  };
}
