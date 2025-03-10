{ pkgs, ... }:

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
  };

  virtualisation = {
    podman.extraPackages = [ pkgs.zfs ];

    containers.storage.settings.storage = {
      driver = "zfs";
      graphroot = "/var/lib/containers/storage";
      runroot = "/run/containers/storage";
      options.zfs.fsname = "zroot/root/services/podman";
    };
  };
}
