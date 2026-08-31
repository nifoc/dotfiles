{ den, ... }:

{
  den.aspects.zfs = {
    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta.zfs;
      in
      {
        services.zfs = {
          trim.enable = true;

          autoSnapshot = {
            enable = true;
            flags = "-k -p --utc";

            daily = 3;
            weekly = 0;
            monthly = 0;
          };

          autoScrub = {
            enable = true;
            interval = "monthly";

            pools = [ "zroot" ] ++ (cfg.extraPools or [ ]);
          };

          zed.settings = {
            ZED_NOTIFY_VERBOSE = true;

            ZED_EMAIL_ADDR = [ "daniel@kempkens.io" ];
            ZED_EMAIL_PROG = "${lib.getExe pkgs.msmtp}";
            ZED_EMAIL_OPTS = "@ADDRESS@";
          };
        };
      };
  };
}
