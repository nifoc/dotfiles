{ pkgs, lib, ... }:

let
  netns = "sc";
  requiredPaths = [ "/dozer/JailVault/media-scraper/Discord" ];
in
{
  systemd = {
    services.ddg = {
      description = "discord-downloader-go service";
      wantedBy = [ ];

      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };

      serviceConfig = {
        Type = "exec";
        User = "media_user";
        Group = "user_media";
        WorkingDirectory = "/dozer/JailVault/media-scraper/Discord";
        ExecStart = "${lib.getExe pkgs.discord-downloader-go}";
        Restart = "on-failure";

        NetworkNamespacePath = "/var/run/netns/${netns}";
        BindReadOnlyPaths = [
          "/etc/netns/${netns}/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/${netns}/nsswitch.conf:/etc/nsswitch.conf:norbind"
          "/etc/netns/${netns}/nscd-kill:/run/nscd:norbind"
        ];
      };
    };

    paths.ddg = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };
  };
}
