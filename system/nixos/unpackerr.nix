{ pkgs, config, ... }:

{
  systemd.services.unpackerr =
    let
      mounts = [ "mnt-downloads.mount" ];
    in
    {
      description = "unpackerr service";
      requires = mounts;
      bindsTo = [ "wg.service" ];
      after = [ "wg.service" ] ++ mounts;
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        User = "media_user";
        Group = "media_group";
        NetworkNamespacePath = "/var/run/netns/wg";
        BindReadOnlyPaths = [
          "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
        ];
        ExecStart = "${pkgs.unpackerr}/bin/unpackerr --config ${config.age.secrets.unpackerr-config.path}";
      };
    };
}
