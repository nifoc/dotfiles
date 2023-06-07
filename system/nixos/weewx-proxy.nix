{ pkgs, config, ... }:

{
  systemd.services.weewx-proxy = {
    description = "A proxy service for WeeWX sources";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
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

  networking.firewall.interfaces."vlan51" = {
    allowedTCPPorts = [ 4040 ];
  };
}
