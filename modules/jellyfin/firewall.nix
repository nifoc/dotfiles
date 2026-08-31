{
  den.aspects.jellyfin = {
    nixos = {
      networking.firewall.interfaces =
        let
          ports = [
            9920
          ];
        in
        {
          "eth0".allowedTCPPorts = ports;
          "eth0".allowedUDPPorts = ports;
          "tailscale0".allowedTCPPorts = ports;
          "tailscale0".allowedUDPPorts = ports;
        };
    };
  };
}
