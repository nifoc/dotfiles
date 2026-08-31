{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.restic = {
    nixos =
      { config, lib, ... }:
      let
        resticConfig = den.aspects.${config.networking.hostName}.meta.restic;

        remoteSshConn = "${resticConfig.remote.user}@${resticConfig.remote.host}";
        secondaryConfig = (resticConfig.secondary or { enabled = false; });
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          restic-remote-password = {
            file = ../../agenix/restic/${config.networking.hostName}/remote-password.age;
          };

          restic-remote-ssh-private-key = {
            file = ../../agenix/restic/${config.networking.hostName}/remote-ssh-private-key.age;
          };

          restic-secondary-password = lib.mkIf secondaryConfig.enabled {
            file = ../../agenix/restic/${config.networking.hostName}/secondary-password.age;
          };
        };

        services.restic = {
          backups = {
            remote = {
              repository = "sftp:${remoteSshConn}:/";
              extraOptions = [
                "sftp.command='ssh ${remoteSshConn} -i ${config.age.secrets.restic-remote-ssh-private-key.path} -s sftp'"
              ];
              initialize = true;

              passwordFile = config.age.secrets.restic-remote-password.path;
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

            secondary = lib.mkIf secondaryConfig.enabled {
              repository = "rclone:jotta:${config.networking.hostName}";
              initialize = true;

              rcloneConfigFile = "/root/.config/rclone/rclone.conf";
              rcloneOptions = {
                bwlimit = "30M";
                jottacloud-hard-delete = true;
                jottacloud-no-versions = true;
              };

              passwordFile = config.age.secrets.restic-secondary-password.path;
              paths = [ ];

              extraBackupArgs = [
                "--cleanup-cache"
                "--no-scan"
              ];

              pruneOpts = [
                "--keep-daily 7"
                "--keep-weekly 5"
                "--keep-monthly 2"
              ];

              user = "root";
              timerConfig = {
                OnCalendar = "02:00";
                RandomizedDelaySec = "3h";
              };
            };
          };
        };
      };
  };
}
