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

  systemd.services.tailscale-wait-up = {
    wantedBy = [ "network-online.target" ];
    before = [ "network-online.target" ];
    requires = [ "tailscaled.service" ];
    after = [
      "sys-subsystem-net-devices-tailscale0.device"
      "tailscaled.service"
    ];

    path = with pkgs; [
      coreutils
      tailscale
    ];

    script = ''
      until tailscale status --peers=false; do
        sleep 1
      done
    '';

    serviceConfig = {
      Type = "oneshot";
      TimeoutSec = 60;
    };
  };

  # No good way to increase the MTU on macOS, so don't do this for now
  # systemd.services.tailscaled.serviceConfig.Environment = [
  #   "TS_DEBUG_MTU=1350"
  # ];
}
