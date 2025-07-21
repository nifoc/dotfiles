{ pkgs, config, ... }:

{
  environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-authkey.path;

    extraUpFlags = [
      "--stateful-filtering"
    ];
  };

  # No good way to increase the MTU on macOS, so don't do this for now
  # systemd.services.tailscaled.serviceConfig.Environment = [
  #   "TS_DEBUG_MTU=1350"
  # ];
}
