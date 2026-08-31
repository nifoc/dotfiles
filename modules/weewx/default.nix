{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.weewx = {
    nixos =
      { config, inputs', ... }:
      let
        pkg = inputs'.nifoc-overlay.packages.weewx;
        home = "/var/lib/weewx-weather";
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          weewx-config = {
            file = ../../agenix/weewx/config.age;
            owner = "weewx";
            group = "weewx";
          };

          weewx-skin = {
            file = ../../agenix/weewx/skin.age;
            path = "${home}/overlay/upper/skins/weewx-wdc/skin.conf";
            owner = "weewx";
            group = "weewx";
          };
        };

        systemd = {
          services.weewx = {
            description = "WeeWX";
            requires = [
              "time-sync.target"
              "mosquitto.service"
            ];
            after = [
              "network-online.target"
              "time-sync.target"
              "mosquitto.service"
            ];
            wants = [ "network-online.target" ];
            wantedBy = [ "multi-user.target" ];

            path = [ pkg ];

            environment = {
              HOME = home;
              LANG = "de_DE.UTF-8";
              TZ = "Europe/Berlin";
            };

            restartTriggers = [
              "${config.age.secrets.weewx-config.file}"
              "${config.age.secrets.weewx-skin.file}"
            ];

            serviceConfig = {
              WorkingDirectory = "${pkg}/home/weewx-data";
              User = "weewx";
              Group = "weewx";
              ExecStart = "${pkg}/bin/weewxd --config=${config.age.secrets.weewx-config.path}";

              CapabilityBoundingSet = [ "" ];
              DeviceAllow = [ "" ];
              LockPersonality = true;
              PrivateDevices = true;
              PrivateUsers = true;
              ProcSubset = "pid";
              ProtectClock = true;
              ProtectControlGroups = true;
              ProtectHome = true;
              ProtectHostname = true;
              ProtectKernelLogs = true;
              ProtectKernelModules = true;
              ProtectKernelTunables = true;
              ProtectProc = "invisible";
              RestrictAddressFamilies = [
                "AF_INET"
                "AF_INET6"
                "AF_UNIX"
              ];
              RestrictNamespaces = true;
              RestrictRealtime = true;
              RestrictSUIDSGID = true;
              SystemCallArchitectures = "native";
              SystemCallFilter = [
                "@system-service"
                "~@privileged"
                "~@resources"
              ];
            };
          };

          tmpfiles.rules = [
            "d ${home} 0755 weewx weewx"
            "d ${home}/data 0755 weewx weewx"
            "d ${home}/data/db 0750 weewx weewx"
            "d ${home}/data/html 0755 weewx weewx"
            "d ${home}/data/html/wdc 0755 weewx weewx"
            "d ${home}/overlay 750 weewx weewx"
            "d ${home}/overlay/upper 750 weewx weewx"
            "d ${home}/overlay/upper/skins 750 weewx weewx"
            "d ${home}/overlay/upper/skins/weewx-wdc 750 weewx weewx"
            "d ${home}/overlay/work 750 weewx weewx"
            "d ${home}/weewx-data 750 weewx weewx"
          ];

          mounts = [
            {
              what = "overlay";
              where = "${home}/weewx-data";
              type = "overlay";
              options = "lowerdir=${pkg}/home/weewx-data,upperdir=${home}/overlay/upper,workdir=${home}/overlay/work";
              before = [ "weewx.service" ];
              wantedBy = [ "weewx.service" ];
            }
          ];
        };

        users = {
          users.weewx = {
            group = "weewx";
            isSystemUser = true;
            inherit home;
            uid = 421;
          };

          groups.weewx = {
            gid = 421;
          };
        };

        i18n.supportedLocales = [
          "C.UTF-8/UTF-8"
          "en_US.UTF-8/UTF-8"
          "de_DE.UTF-8/UTF-8"
        ];

        services.restic.backups.remote.paths = [ "${home}/data/db" ];
      };
  };
}
