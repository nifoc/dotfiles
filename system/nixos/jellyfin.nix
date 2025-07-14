{ lib, ... }:

let
  requiredPaths = [
    "/dozer/MediaVault/Anime"
    "/dozer/MediaVault/Deutsche Serien"
    "/dozer/media/Deutsche Filme"
    "/dozer/media/Documentaries"
    "/dozer/media/Movies"
    "/dozer/media/TV Shows"
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
          "/dozer/MediaVault/Anime"
          "/dozer/media/Documentaries"
          "/dozer/media/Movies"
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

    tmpfiles.rules = [
      "L /mnt/media/Anime - - - - /dozer/MediaVault/Anime"
      "L /mnt/media/Deutsche\\x20Serien - - - - /dozer/MediaVault/Deutsche\\x20Serien"
      "L /mnt/media/Deutsche\\x20Filme - - - - /dozer/media/Deutsche\\x20Filme"
      "L /mnt/media/Documentaries - - - - /dozer/media/Documentaries"
      "L /mnt/media/Movies - - - - /dozer/media/Movies"
      "L /mnt/media/TV\\x20Shows - - - - /dozer/media/TV\\x20Shows"
    ];
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
        serverAliases = [ "jellyfin-local.internal.kempkens.network" ];

        extraConfig = ''
          encode

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          reverse_proxy 127.0.0.1:8096 {
            flush_interval -1
          }
        '';
      };
    };
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
