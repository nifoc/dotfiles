{ lib, ... }:

{
  services.chrony = {
    enable = true;

    servers = [
      "ptbtime1.ptb.de"
      "ptbtime2.ptb.de"
      "ptbtime3.ptb.de"
      "ntp1.rwth-aachen.de"
      "ntp2.rwth-aachen.de"
      "ntp3.rwth-aachen.de"
      "ntp1.hetzner.de"
      "ntp2.hetzner.de"
      "ntp3.hetzner.de"
      "time.cloudflare.com"
    ];

    extraConfig = ''
      makestep 1.0 3

      bindaddress 0.0.0.0
      port 123
      allow
    '';
  };

  services.timesyncd.enable = lib.mkForce false;

  networking.firewall = {
    allowedUDPPorts = [ 123 ];
    allowedTCPPorts = [ 123 ];
  };
}
