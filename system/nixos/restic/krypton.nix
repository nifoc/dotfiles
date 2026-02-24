{ pkgs, config, ... }:

let
  user = "u345${toString (103 + 100)}-sub3";
  host = "u345${toString (103 + 100)}-sub3.your-storagebox.de";
  sshConn = "${user}@${host}";
in
{
  services.restic = {
    backups = {
      remote = {
        repository = "sftp:${sshConn}:/";
        extraOptions = [
          "sftp.command='ssh ${sshConn} -i ${config.age.secrets.restic-ssh-private-key.path} -s sftp'"
        ];
        initialize = true;

        passwordFile = config.age.secrets.restic-password.path;
        paths = [ ];

        pruneOpts = [ "--keep-daily 5" ];

        user = "root";
        timerConfig = {
          OnCalendar = "02:00";
          RandomizedDelaySec = "3h";
        };
      };

      secondary = {
        repository = "rclone:jotta:krypton";
        initialize = true;

        rcloneConfigFile = "/root/.config/rclone/rclone.conf";
        rcloneOptions = {
          bwlimit = "10M";
          jottacloud-hard-delete = true;
          jottacloud-no-versions = true;
        };

        passwordFile = config.age.secrets.restic-password-two.path;
        paths = [ ];

        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 5"
        ];

        user = "root";
        timerConfig = {
          OnCalendar = "02:00";
          RandomizedDelaySec = "3h";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [ rclone ];
}
