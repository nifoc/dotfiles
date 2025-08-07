{ config, lib, ... }:

let
  cfg = config.services.audiobookshelf;
in
{
  systemd = {
    services.audiobookshelf = {
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = [ "/dozer/MediaVault/Audio" ];
      };
    };

    paths.jellyfin = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };
  };

  services = {
    audiobookshelf = {
      enable = true;
      user = "media_user";
      group = "user_media";
      openFirewall = false;

      host = "127.0.0.1";
      port = 8067;
    };

    caddy.virtualHosts."audiobookshelf.internal.kempkens.network" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        reverse_proxy ${cfg.host}:${toString cfg.port} {
          flush_interval -1
        }
      '';
    };
  };
}
