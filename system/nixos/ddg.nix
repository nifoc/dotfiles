{ pkgs, lib, ... }:

{
  systemd.services.ddg =
    let
      mounts = [ "mnt-media\\x2dscraper.mount" ];
    in
    {
      description = "discord-downloader-go service";
      requires = mounts;
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "exec";
        WorkingDirectory = "/mnt/media-scraper/Discord";
        User = "media_user";
        Group = "media_group";
        ExecStart = "${lib.getExe pkgs.discord-downloader-go}";
        Restart = "on-failure";
      };
    };
}
