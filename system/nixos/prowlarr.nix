{ pkgs, lib, ... }:

{
  services.prowlarr = {
    enable = true;
    openFirewall = false;
  };

  systemd.services.prowlarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
    };
  };

  systemd.services.socat-prowlarr = {
    description = "socat exposes prowlarr";
    bindsTo = [ "wg.service" ];
    after = [ "wg.service" ];

    serviceConfig = {
      Type = "simple";
      RuntimeDirectory = "socat-prowlarr";
      DynamicUser = true;
      UMask = "000";
      NetworkNamespacePath = "/var/run/netns/wg";
      ExecStart = "${pkgs.socat}/bin/socat -d -d UNIX-LISTEN:/run/socat-prowlarr/prowlarr.sock,unlink-early,fork TCP4:127.0.0.1:9696";
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
      proxyPass = "http://unix:/run/socat-prowlarr/prowlarr.sock:/";
    };
  };
}
