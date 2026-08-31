{ den, ... }:

{
  den.aspects.ntp.provides.server = {
    includes = with den.aspects; [
      ntp
    ];

    nixos = {
      services.chrony.extraConfig = ''
        bindaddress 0.0.0.0
        port 123
        allow
      '';

      networking.firewall = {
        allowedUDPPorts = [ 123 ];
        allowedTCPPorts = [ 123 ];
      };
    };
  };
}
