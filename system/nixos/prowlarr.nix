{ pkgs, ... }:

{
  services.prowlarr = {
    enable = true;
    openFirewall = false;
  };

  systemd.services.prowlarr = {
    bindsTo = [ "netns@wg.service" ];
    after = [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
    };
  };

  systemd.services.socat-prowlarr = {
    description = "socat exposes prowlarr";
    bindsTo = [ "netns@wg.service" ];
    after = [ "network.target" "wg.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      User = "nobody";
      NetworkNamespacePath = "/var/run/netns/wg";
      ExecStart = "${pkgs.socat}/bin/socat UNIX-LISTEN:/tmp/prowlarr.sock,unlink-early,fork TCP4:127.0.0.1:9696";
      Restart = "on-failure";
    };
  };
}
