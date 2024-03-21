{ pkgs, config, ... }:

{
  hardware.rtl-sdr.enable = true;

  systemd.services.rtl_433 = {
    description = "rtl_433 service";
    after = [ "mosquitto.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "exec";
      ExecStart = "${pkgs.rtl_433}/bin/rtl_433 -f868.3M -Yclassic -Mtime:utc -R78 -Fmqtt://127.0.0.1:1883,user=rtl,pass=didYouFindThis,retain=0,events=rtl433";
    };
  };

  services.mosquitto.listeners = [
    {
      address = "0.0.0.0";
      port = 1883;

      settings = {
        protocol = "mqtt";
      };

      users = {
        rtl = {
          password = "didYouFindThis";
          acl = [ "write rtl433" ];
        };

        weewx-proxy = {
          hashedPasswordFile = config.age.secrets.mosquitto-password-weewx-proxy.path;
          acl = [ "read rtl433" ];
        };
      };
    }
  ];

  networking.firewall.interfaces =
    let
      mosquittoPorts = [ 1883 ];
    in
    {
      "end0".allowedTCPPorts = mosquittoPorts;
    };
}
