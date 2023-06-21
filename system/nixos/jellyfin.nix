{ pkgs, lib, ... }:

{
  services.jellyfin = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  systemd.services.jellyfin =
    let
      mounts = [
        "mnt-media-TV\\x20Shows.mount"
        "mnt-media-Documentaries.mount"
        "mnt-media-Anime.mount"
        "mnt-media-Movies.mount"
        "mnt-media-Deutsche\\x20Serien.mount"
        "mnt-media-Deutsche\\x20Filme.mount"
      ];
    in
    {
      requires = mounts;
      after = lib.mkAfter mounts;
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

  services.nginx.virtualHosts."jellyfin.home.kempkens.io" = {
    listen = [
      {
        addr = "0.0.0.0";
        port = 9921;
        ssl = true;
        extraParameters = [ "proxy_protocol" ];
      }
    ];

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      set_real_ip_from 100.108.165.26/32;
      set_real_ip_from fd7a:115c:a1e0:ab12:4843:cd96:626c:a51a/128;
      real_ip_header proxy_protocol;
    '';

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
      ports = [ 9920 9921 ];
    in
    {
      "ens3".allowedTCPPorts = ports;
      "ens3".allowedUDPPorts = ports;
      "tailscale0".allowedTCPPorts = ports;
      "tailscale0".allowedUDPPorts = ports;
    };
}
