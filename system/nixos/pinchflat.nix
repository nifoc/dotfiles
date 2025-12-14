{ lib, config, ... }:

let
  fqdn = "pinchflat.internal.kempkens.network";
  internalIP = "127.0.0.1";
  requiredPaths = [
    "/dozer/MediaVault/Pinchflat"
  ];
in
{
  services = {
    pinchflat = {
      enable = true;
      user = "media_user";
      group = "user_media";
      openFirewall = false;

      secretsFile = config.age.secrets.pinchflat-config.path;

      mediaDir = "/dozer/MediaVault/Pinchflat";

      extraConfig = {
        UMASK = "002";
      };
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${toString config.services.pinchflat.port}
      '';
    };
  };

  systemd = {
    services.pinchflat = {
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    paths.pinchflat = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };
  };
}
