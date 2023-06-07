{ lib, ... }:

{
  services.chrony = {
    enable = true;

    servers = [
      "ptbtime1.ptb.de"
      "ptbtime2.ptb.de"
      "time.cloudflare.com"
      "ntp1.hetzner.de"
    ];

    extraConfig = ''
      bindaddress 0.0.0.0
      port 123
      allow
    '';
  };

  systemd.services.chronyd = {
    after = lib.mkForce [ "network-online.target" "nss-lookup.target" ];
  };

  networking.firewall.interfaces."end0" = {
    allowedUDPPorts = [ 123 ];
    allowedTCPPorts = [ 123 ];
  };
}
