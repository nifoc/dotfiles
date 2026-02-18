{
  services.dante = {
    enable = true;

    config = ''
      internal: 100.116.103.122 port = 1080
      internal: fd7a:115c:a1e0::6a3a:677a port = 1080
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

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 1080 ];
}
