{ den, ... }:

{
  den.aspects.rtl433 = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        rtl_433 = lib.getExe pkgs.rtl_433;
        mqttConfig = den.aspects.${config.networking.hostName}.meta.mqtt.rtl433;
      in
      {
        hardware.rtl-sdr.enable = true;

        systemd.services.rtl_433 = {
          description = "rtl_433 service";
          wantedBy = [ "multi-user.target" ];

          serviceConfig = {
            Type = "exec";
            ExecStart = "${rtl_433} -f868.3M -Yclassic -Mtime:utc -R78 -Fmqtt://${mqttConfig.host}:${toString mqttConfig.port},user=${mqttConfig.user},pass=${mqttConfig.password},retain=0,events=${mqttConfig.topic}";
          };
        };
      };
  };
}
