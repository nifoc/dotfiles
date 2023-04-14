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
      UMask = "000";
      ExecStart = "${pkgs.socat}/bin/socat -d -d UNIX-LISTEN:/run/socat_prowlarr.sock,unlink-early,fork TCP4:127.0.0.1:9696";
      Restart = "on-failure";
    };
  };

  services.nginx.virtualHosts."prowlarr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://unix:/run/socat_prowlarr.sock:/";
    };
  };
}
