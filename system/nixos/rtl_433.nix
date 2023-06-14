{ pkgs, config, ... }:

{
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
      "enu1u1u1".allowedTCPPorts = mosquittoPorts;
    };

  services.udev.extraRules = ''
    # original RTL2832U vid/pid (hama nano, for example)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2832", ENV{ID_SOFTWARE_RADIO}="1", MODE="0660", GROUP="plugdev"

    # RTL2832U OEM vid/pid, e.g. ezcap EzTV668 (E4000), Newsky TV28T (E4000/R820T) etc.
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", ENV{ID_SOFTWARE_RADIO}="1", MODE="0660", GROUP="plugdev"
  '';
}
