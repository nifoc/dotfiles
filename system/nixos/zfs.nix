{
  services.zfs = {
    trim.enable = true;

    autoSnapshot = {
      enable = true;
      flags = "-k -p --utc";

      monthly = 3;
    };

    autoScrub = {
      enable = true;
      interval = "monthly";

      pools = [ "zroot" ];
    };
  };
}
