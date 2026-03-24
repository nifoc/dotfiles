{
  pkgs,
  lib,
  config,
  ...
}:

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

      pools = [ "zroot" ];
    };

    zed.settings = {
      ZED_NOTIFY_VERBOSE = true;

      ZED_EMAIL_ADDR = [ "daniel@kempkens.io" ];
      ZED_EMAIL_PROG = "${lib.getExe pkgs.msmtp}";
      ZED_EMAIL_OPTS = "@ADDRESS@";
    };
  };

  virtualisation = {
    podman.extraPackages = [ config.boot.zfs.package ];

    containers.storage.settings.storage = {
      driver = "zfs";
      graphroot = "/var/lib/containers/storage";
      runroot = "/run/containers/storage";
      options.zfs.fsname = "zroot/root/services/podman";
    };
  };
}
