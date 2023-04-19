{ pkgs, lib, ... }:

{
  services.jellyfin = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  services.nginx.virtualHosts."jellyfin.internal.kempkens.network" = {
    listen = [
      {
        addr = "0.0.0.0";
        port = 9920;
        ssl = true;
      }

      {
        addr = "[::0]";
        port = 9920;
        ssl = true;
      }
    ];

    quic = true;
    http3 = true;

    serverAliases = [ "jellyfin.home.kempkens.io" ];

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8096";
    };

    locations."/socket" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8096";
      proxyWebsockets = true;
    };
  };

  networking.firewall.interfaces =
    let
      ports = [ 9920 ];
    in
    {
      "ens3".allowedTCPPorts = ports;
      "ens3".allowedUDPPorts = ports;
      "tailscale0".allowedTCPPorts = ports;
      "tailscale0".allowedUDPPorts = ports;
    };
}
