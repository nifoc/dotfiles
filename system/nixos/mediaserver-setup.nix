{ pkgs, ... }:

{
  users.groups.media_group = {
    gid = 2001;
  };

  users.users.media_user = {
    uid = 1001;
    group = "media_group";
    isSystemUser = true;
    description = "Media User";
    home = "/var/lib/media_user";
    createHome = true;
    autoSubUidGidRange = true;
  };

  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = [ pkgs.nfs-utils ];
  services.rpcbind.enable = true;

  systemd = {
    mounts = [
      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/downloads";
        where = "/mnt/downloads";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/media/TV Shows";
        where = "/mnt/media/TV Shows";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/media/Documentaries";
        where = "/mnt/media/Documentaries";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/MediaVault/Anime";
        where = "/mnt/media/Anime";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/media/Movies";
        where = "/mnt/media/Movies";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/MediaVault/Deutsche Serien";
        where = "/mnt/media/Deutsche Serien";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/media/Deutsche Filme";
        where = "/mnt/media/Deutsche Filme";
      }

      {
        type = "nfs";
        mountConfig = {
          Options = "noatime,nconnect=16";
        };
        what = "10.0.0.100:/mnt/dozer/MediaVault/YTDL";
        where = "/mnt/media/YTDL";
      }
    ];

    automounts = [
      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/downloads";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/TV Shows";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/Documentaries";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/Anime";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/Movies";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/Deutsche Serien";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/Deutsche Filme";
      }

      {
        wantedBy = [ "multi-user.target" ];
        where = "/mnt/media/YTDL";
      }
    ];
  };
}
