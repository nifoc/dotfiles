{ pkgs, config, ... }:

let
  netns = "dl";
  requiredPaths = [ "/dozer/downloads" ];
in
{
  systemd = {
    services.unpackerr = {
      description = "unpackerr service";
      bindsTo = [ "wg-${netns}.service" ];
      after = [
        "network-online.target"
        "wg-${netns}.service"
      ];
      wants = [ "network-online.target" ];
      wantedBy = [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };

      serviceConfig = {
        Type = "simple";
        User = "media_user";
        Group = "user_media";
        NetworkNamespacePath = "/var/run/netns/${netns}";
        BindReadOnlyPaths = [
          "/etc/netns/${netns}/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/${netns}/nsswitch.conf:/etc/nsswitch.conf:norbind"
        ];
        ExecStart = "${pkgs.unpackerr}/bin/unpackerr --config ${config.age.secrets.unpackerr-config.path}";
      };
    };

    paths.unpackerr = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathExists = requiredPaths;
        DirectoryNotEmpty = requiredPaths;
      };
    };
  };
}
