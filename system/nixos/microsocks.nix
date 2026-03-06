{ lib, ... }:

{
  services.microsocks = {
    enable = true;

    ip = "100.116.103.122";
    outgoingBindIp = "10.0.0.5";
  };

  systemd.services.microsocks = {
    requires = lib.mkAfter [ "tailscale-wait-up.service" ];
    after = lib.mkAfter [ "tailscale-wait-up.service" ];
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 1080 ];
}
