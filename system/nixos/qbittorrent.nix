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
        ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox --profile=/var/lib/qbittorrent";
        AmbientCapabilities = [ "CAP_NET_RAW" ];
      };
    };
}
