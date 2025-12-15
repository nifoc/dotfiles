{ lib, ... }:

let
  requiredPaths = [
    "/dozer/MediaVault/Anime"
    "/dozer/MediaVault/Deutsche Serien"
    "/dozer/media/Deutsche Filme"
    "/dozer/media/Documentaries"
    "/dozer/media/Movies"
    "/dozer/media/TV Shows"
    "/dozer/MediaVault/Pinchflat"
    "/dozer/MediaVault/YTDL"
  ];
in
{
  systemd = {
    services.jellyfin = {
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };

      serviceConfig = {
        BindReadOnlyPaths = [
          "/dozer/MediaVault/Anime:/mnt/media/Anime"
          "\"/dozer/media/Deutsche Filme\":\"/mnt/media/Deutsche Filme\""
          "\"/dozer/MediaVault/Deutsche Serien\":\"/mnt/media/Deutsche Serien\""
          "/dozer/media/Documentaries:/mnt/media/Documentaries"
          "/dozer/media/Movies:/mnt/media/Movies"
          "\"/dozer/media/TV Shows\":\"/mnt/media/TV Shows\""
          "/dozer/MediaVault/Pinchflat"
          "/dozer/MediaVault/YTDL"
        ];
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
    jellyfin = {
      enable = true;
      user = "media_user";
      group = "user_media";
      openFirewall = false;
    };

    caddy.virtualHosts = {
      "jellyfin.internal.kempkens.network:9920" = {

        extraConfig = ''
          encode

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          reverse_proxy 127.0.0.1:8096 {
            flush_interval -1
          }
        '';
      };
    };

    restic.backups.remote.paths = [
      "/var/lib/jellyfin/config"
      "/var/lib/jellyfin/data"
    ];
  };

  networking.firewall.interfaces =
    let
      ports = [
        9920
      ];
    in
    {
      "eth0".allowedTCPPorts = ports;
      "eth0".allowedUDPPorts = ports;
      "tailscale0".allowedTCPPorts = ports;
      "tailscale0".allowedUDPPorts = ports;
    };
}
