{
  config,
  lib,
  host,
  ...
}:

{
  services.immich.machine-learning = {
    enable = true;

    environment = {
      IMMICH_HOST = lib.mkForce host;
    };
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = lib.mkIf (host != "localhost") [
    config.services.immich.port
  ];
}
