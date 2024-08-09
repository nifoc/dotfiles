{ pkgs, ... }:

{
  hardware.rtl-sdr.enable = true;

  systemd.services.rtl_433 = {
    description = "rtl_433 service";
    after = [ "mosquitto.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "exec";
      ExecStart = "${pkgs.rtl_433}/bin/rtl_433 -f868.3M -Yclassic -Mtime:utc -R78 -Fmqtt://10.0.0.5:1883,user=rtl,pass=didYouFindThis,retain=0,events=rtl433";
    };
  };
}
