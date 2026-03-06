{ lib, ... }:

let
  internalInterface = "tailscale0";
in
{
  services.dante = {
    enable = true;

    config = ''
      internal: ${internalInterface} port = 1080
      external: end0

      clientmethod: none
      socksmethod: none

      client pass {
              from: 0/0 to: 0/0
      }

      #generic pass statement - bind/outgoing traffic
      socks pass {
              from: 0/0 to: 0/0
              command: bind connect udpassociate
              log: error # connect disconnect iooperation
      }

      #generic pass statement for incoming connections/packets
      socks pass {
              from: 0/0 to: 0/0
              command: bindreply udpreply
              log: error # connect disconnect iooperation
      }
    '';
  };

  systemd.services.dante = {
    requires = lib.mkAfter [ "tailscale-wait-up.service" ];
    after = lib.mkAfter [ "tailscale-wait-up.service" ];
  };

  networking.firewall.interfaces."${internalInterface}".allowedTCPPorts = [ 1080 ];
}
