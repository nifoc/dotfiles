{ pkgs, lib, ... }:

let
  requiredPaths = [ "/dozer/JailVault/media-scraper/Discord" ];
in
{
  systemd = {
    services.ddg = {
      description = "discord-downloader-go service";
      wantedBy = [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };

      serviceConfig = {
        Type = "exec";
        WorkingDirectory = "/dozer/JailVault/media-scraper/Discord";
        User = "media_user";
        Group = "user_media";
        ExecStart = "${lib.getExe pkgs.discord-downloader-go}";
        Restart = "on-failure";
      };
    };

    paths.ddg = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathExists = requiredPaths;
        DirectoryNotEmpty = requiredPaths;
      };
    };
  };
}
