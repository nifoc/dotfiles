{
  users.users.media_user = {
    uid = 1001;
    isSystemUser = true;
    description = "Media User";
  };

  users.groups.media_group = {
    gid = 2001;
    members = [ "media_user" ];
  };

  services.rpcbind.enable = true;

  systemd.mounts = [
    {
      type = "nfs";
      mountConfig = {
        Options = "noatime";
      };
      what = "10.0.0.100:/mnt/dozer/downloads";
      where = "/mnt/downloads";
    }
  ];
}
