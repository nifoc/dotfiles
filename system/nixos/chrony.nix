{ lib, ... }:

{
  services.chrony = {
    enable = true;

    servers = [
      "ptbtime1.ptb.de"
      "ptbtime2.ptb.de"
      "ptbtime3.ptb.de"
      "134.130.4.17" # "ntp1.rwth-aachen.de"
      "134.130.5.17" # "ntp2.rwth-aachen.de"
      "137.226.119.25" # "ntp3.rwth-aachen.de"
      "ntp1.hetzner.de"
      "ntp2.hetzner.de"
      "ntp3.hetzner.de"
      "time.cloudflare.com"
    ];

    extraConfig = ''
      burst 3/3
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
