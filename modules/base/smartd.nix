{ den, ... }:

{
  den.aspects.base = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta.smartd;
        disks = (cfg.disks or [ ]);
      in
      {
        services.smartd = {
          enable = (disks != [ ]);

          autodetect = true;

          defaults.monitored = "-a -o on -s S/../../(1|4)/02";

          notifications = {
            mail = {
              enable = config.programs.msmtp.enable;
              sender = "server@kempkens.io";
              recipient = "daniel@kempkens.io";
            };

            wall.enable = true;
            x11.enable = false;

            test = false;
          };
        };

        systemd.services.smart-enable-all-drives = lib.mkIf config.services.smartd.enable {
          description = "Enable SMART on all connected drives";
          before = [ "smartd.service" ];
          wantedBy = [ "multi-user.target" ];

          path = with pkgs; [ smartmontools ];

          script = lib.strings.concatMapStringsSep "\n" (disk: ''
            smartctl -s on "/dev/disk/by-id/${disk}" || true
          '') disks;

          serviceConfig = {
            Type = "oneshot";
          };
        };
      };
  };
}
