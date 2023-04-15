{
  users.groups.media_group = {
    gid = 2001;
  };

  users.users.media_user = {
    uid = 1001;
    isSystemUser = true;
    description = "Media User";
    group = "media_group";
  };

  services.rpcbind.enable = true;

  systemd = {
    mounts = [
      {
        type = "nfs";
        mountConfig = {
          Options = "noatime";
        };
        what = "10.0.0.100:/mnt/dozer/downloads";
        where = "/mnt/downloads";
      }
    ];

    automounts = [
      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/downloads";
      }
    ];
  };
}
