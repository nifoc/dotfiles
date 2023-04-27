{ pkgs, lib, ... }:

{
  services.sonarr = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  systemd.services.sonarr =
    let
      mounts = [
        "mnt-media-TV\\x20Shows.mount"
        "mnt-media-Documentaries.mount"
        "mnt-media-Anime.mount"
        "mnt-downloads.mount"
      ];
    in
    {
      requires = mounts;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ mounts);

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
