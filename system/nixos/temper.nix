{ pkgs, ... }:

{
  systemd.services.temper-to-home-assistant =
    let
      script = pkgs.writeScriptBin "temper-to-ha-mqtt" ''
        #! ${pkgs.runtimeShell} -e

        temp=$(${pkgs.python312Packages.temperusb}/bin/temper-poll -c -s 0)
        ${pkgs.mosquitto}/bin/mosquitto_pub -h 10.0.0.230 -m "$temp" -t hadata/temper/serverraum -u mqtt_bridge -P verySecurePassword
      '';
    in
    {
      description = "Send current temperature reading to HA using MQTT";
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];
      startAt = "*-*-* *:*:00";

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${script}/bin/temper-to-ha-mqtt";
      };
    };
}
