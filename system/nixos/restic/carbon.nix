{ config, ... }:

let
  user = "u345${toString (103 + 100)}-sub1";
  host = "u345${toString (103 + 100)}-sub1.your-storagebox.de";
  sshConn = "${user}@${host}";
in
{
  services.restic = {
    backups.remote = {
      repository = "sftp:${sshConn}:/";
      extraOptions = [
        "sftp.command='ssh ${sshConn} -i ${config.age.secrets.restic-ssh-private-key.path} -s sftp'"
      ];
      initialize = true;

      passwordFile = config.age.secrets.restic-password.path;
      paths = [ ];

      extraBackupArgs = [
        "--cleanup-cache"
        "--no-scan"
      ];

      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 2"
        "--keep-monthly 1"
      ];

      user = "root";
      timerConfig = {
        OnCalendar = "02:00";
        RandomizedDelaySec = "3h";
      };
    };
  };
}
