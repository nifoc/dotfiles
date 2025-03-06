{
  services.zfs = {
    trim.enable = true;

    autoSnapshot = {
      enable = true;
      flags = "-k -p --utc";

      daily = 5;
      weekly = 0;
      monthly = 0;
    };

    autoScrub = {
      enable = true;
      interval = "monthly";

      pools = [ "zroot" ];
    };
  };
}
