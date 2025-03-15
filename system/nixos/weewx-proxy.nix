{ pkgs, config, ... }:

{
  systemd.services.weewx-proxy = {
    description = "A proxy service for WeeWX sources";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    restartTriggers = [ "${config.age.secrets.weewx-proxy-environment.file}" ];

    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "weewx-proxy";
      EnvironmentFile = [ config.age.secrets.weewx-proxy-environment.path ];
      ExecStart = "${pkgs.weewx-proxy}/bin/weewx_proxy start";
      Type = "notify";
      WatchdogSec = "10s";
      Restart = "on-failure";
    };
  };

  services.mosquitto = {
    listeners = [
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

          deye = {
            password = "didYouFindThis";
            acl = [ "write deye/#" ];
          };

          bitshake = {
            password = "didYouFindThis";
            acl = [ "write bitshake/#" ];
          };

          weewx = {
            hashedPasswordFile = config.age.secrets.mosquitto-password-weewx.path;
            acl = [ "read weewx/+" "write weather/+" ];
          };

          weewx-proxy = {
            hashedPasswordFile = config.age.secrets.mosquitto-password-weewx-proxy.path;
            acl = [ "read rtl433" "read deye/#" "read bitshake/#" "write hadata/#" "write weewx/+" ];
          };

          home-assistant = {
            passwordFile = config.age.secrets.mosquitto-password-home-assistant.path;
            acl = [ "readwrite #" ];
          };
        };
      }
    ];

    bridges.home-assistant = {
      addresses = [{ address = "10.0.0.230"; port = 1883; }];
      settings = {
        remote_username = "mqtt_bridge";
        remote_password = "verySecurePassword";
        try_private = true;
      };
      topics = [ "hadata/# out" "deye/# out" ];
    };
  };

  networking.firewall.interfaces =
    let
      mosquittoPorts = [ 1883 ];
    in
    {
      "end0".allowedTCPPorts = mosquittoPorts;
      "vlan51".allowedTCPPorts = [ 4040 ] ++ mosquittoPorts;
    };
}
