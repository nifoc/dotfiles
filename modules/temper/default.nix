{ den, ... }:

{
  den.aspects.temper = {
    nixos =
      { pkgs, config, ... }:
      let
        mqttConfig = den.aspects.${config.networking.hostName}.meta.mqtt.home-assistant;

        script = pkgs.writeScriptBin "temper-to-ha-mqtt" ''
          #! ${pkgs.runtimeShell} -e

          temp=$(${pkgs.python312Packages.temperusb}/bin/temper-poll -c -s 0)
          ${pkgs.mosquitto}/bin/mosquitto_pub -h ${mqttConfig.host} -m "$temp" -t ${mqttConfig.topic}/temper/serverraum -u ${mqttConfig.user} -P ${mqttConfig.password}
        '';
      in
      {
        systemd.services.temper-to-home-assistant = {
          description = "Send current temperature reading to HA using MQTT";
          wants = [ "network-online.target" ];
          after = [ "network-online.target" ];
          startAt = "*-*-* *:*:00";

          serviceConfig = {
            Type = "oneshot";
            ExecStart = "${script}/bin/temper-to-ha-mqtt";
          };
        };
      };
  };
}
