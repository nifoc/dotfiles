{ pkgs, lib, ... }:

{
  services.jellyfin = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  services.nginx.virtualHosts."jellyfin.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:7878";
      proxyWebsockets = true;
    };
  };
}
