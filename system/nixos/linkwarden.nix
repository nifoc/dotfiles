{ lib, config, ... }:

let
  fqdn = "linkwarden.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = 8020;
  requiredPaths = [
    "/dozer/MediaVault/Linkwarden"
  ];
in
{
  services = {
    linkwarden = {
      enable = true;
      host = internalIP;
      port = internalPort;
      openFirewall = false;

      storageLocation = "/dozer/MediaVault/Linkwarden";
      enableRegistration = false;

      environmentFile = config.age.secrets.linkwarden-environment.path;

      environment = {
        NEXTAUTH_URL = "https://${fqdn}";
        CHECKPOINT_DISABLE = "1";
      };
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${toString internalPort}
      '';
    };
  };

  systemd = {
    services.linkwarden = {
      wantedBy = lib.mkForce [ ];

      unitConfig = {
        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    paths.linkwarden = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };
  };
}
