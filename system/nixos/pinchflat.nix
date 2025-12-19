{ lib, config, ... }:

let
  fqdn = "pinchflat.internal.kempkens.network";
  internalIP = "10.0.200.100";
  netns = "dt";
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
        YT_DLP_WORKER_CONCURRENCY = "1";
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
      bindsTo = [ "vlan-ns-${netns}.service" ];
      after = [ "vlan-ns-${netns}.service" ];

      serviceConfig = {
        NetworkNamespacePath = "/var/run/netns/${netns}";
        BindReadOnlyPaths = [
          "/etc/netns/${netns}/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/${netns}/nsswitch.conf:/etc/nsswitch.conf:norbind"
        ];
      };

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
