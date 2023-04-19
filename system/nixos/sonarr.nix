{ pkgs, lib, ... }:

{
  services.sonarr = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  systemd.services.sonarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
      BindReadOnlyPaths = [
        "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
        "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
      ];
    };
  };

  services.nginx.virtualHosts."sonarr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:8989";
      proxyWebsockets = true;
    };
  };
}
