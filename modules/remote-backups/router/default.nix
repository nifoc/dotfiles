{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.remote-backups.provides.router = {
    nixos =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          remote-backups-router-environment = {
            file = ../../../agenix/remote-backups/router/environment.age;
          };
        };

        systemd = {
          services.remote-backups-router = {
            description = "Backup the OPNsense router";
            startAt = "*-*-* 00:00:00";
            restartIfChanged = true;

            path = with pkgs; [
              coreutils
              curl
            ];

            script = ''
              curl --fail -o config.xml.tmp -u "$API_KEY":"$API_SECRET" "$API_URL"
              if [ "$?" -eq 0 ]; then
                rm -f config.xml
                mv config.xml.tmp config.xml
                chmod 600 config.xml
              else
                rm -f config.xml.tmp
              fi
            '';

            serviceConfig = {
              Type = "oneshot";
              User = "root";
              Group = "root";
              EnvironmentFile = config.age.secrets.remote-backups-router-environment.path;
              WorkingDirectory = "/var/backup/remote-backups-router";

              DevicePolicy = "closed";
              LockPersonality = true;
              ProtectControlGroups = true;
              ProtectKernelModules = true;
              ProtectKernelTunables = true;
              PrivateDevices = true;
              PrivateTmp = true;
              RestrictNamespaces = true;
            };
          };

          timers.remote-backups-router.timerConfig.RandomizedDelaySec = "1h";

          tmpfiles.rules = [
            "d /var/backup/remote-backups-router 0750 root root"
          ];
        };

        services.restic.backups = {
          remote.paths = [ "/var/backup/remote-backups-router" ];
          secondary.paths = [ "/var/backup/remote-backups-router" ];
        };
      };
  };
}
