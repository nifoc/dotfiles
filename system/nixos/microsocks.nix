{
  lib,
  listenIP,
  listenInterface ? "tailscale0",
  outgoingIP,
  ...
}:

{
  services.microsocks = {
    enable = true;

    ip = listenIP;
    outgoingBindIp = outgoingIP;

    disableLogging = true;
  };

  systemd.services.microsocks = {
    requires = lib.mkAfter [ "tailscale-wait-up.service" ];
    after = lib.mkAfter [ "tailscale-wait-up.service" ];
  };

  networking.firewall.interfaces."${listenInterface}".allowedTCPPorts = [ 1080 ];
}
