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
        DirectoryNotEmpty = requiredPaths;
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

    nginx.virtualHosts = {
      "jellyfin.internal.kempkens.network" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 9920;
            ssl = true;
            extraParameters = [
              "fastopen=63"
              "backlog=1023"
              "deferred"
            ];
          }

          {
            addr = "[::0]";
            port = 9920;
            ssl = true;
            extraParameters = [
              "fastopen=63"
              "backlog=1023"
              "deferred"
            ];
          }
        ];

        quic = true;
        http3 = true;

        onlySSL = true;
        useACMEHost = "internal.kempkens.network";

        serverAliases = [ "jellyfin-local.internal.kempkens.network" ];

        locations."/" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:8096";
        };

        locations."/socket" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:8096";
          proxyWebsockets = true;
        };
      };

      "jellyfin.home.kempkens.io" = {
        listen = [
          {
            addr = "0.0.0.0";
            port = 9921;
            ssl = true;
            extraParameters = [
              "proxy_protocol"
              "fastopen=63"
              "backlog=1023"
              "deferred"
            ];
          }
        ];

        quic = false;

        onlySSL = true;
        useACMEHost = "internal.kempkens.network";

        extraConfig = ''
          set_real_ip_from 100.90.7.38/32;
          set_real_ip_from fd7a:115c:a1e0::2101:727/128;
          real_ip_header proxy_protocol;
        '';

        locations."/" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:8096";
        };

        locations."/socket" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:8096";
          proxyWebsockets = true;
        };
      };
    };
  };

  networking.firewall.interfaces =
    let
      ports = [
        9920
        9921
      ];
    in
    {
      "eth0".allowedTCPPorts = ports;
      "eth0".allowedUDPPorts = ports;
      "tailscale0".allowedTCPPorts = ports;
      "tailscale0".allowedUDPPorts = ports;
    };
}
