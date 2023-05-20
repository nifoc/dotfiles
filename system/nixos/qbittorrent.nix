{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/qbittorrent 0750 media_user media_group"
  ];

  systemd.services.qbittorrent =
    let
      mounts = [ "mnt-downloads.mount" ];
    in
    {
      description = "qbittorrent instance";
      requires = mounts;
      bindsTo = [ "wg.service" ];
      after = [ "wg.service" ] ++ mounts;
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "exec";
        User = "media_user";
        Group = "media_group";
        NetworkNamespacePath = "/var/run/netns/wg";
        BindReadOnlyPaths = [
          "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
        ];
        ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox --profile=/var/lib/qbittorrent --webui-port=8071";
        AmbientCapabilities = [ "CAP_NET_RAW" ];
      };
    };

  services.nginx.virtualHosts."qbittorrent.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:8071";
    };
  };
}
