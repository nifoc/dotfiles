{
  services.eternal-terminal = {
    enable = true;

    port = 2022;
  };

  systemd.services.eternal-terminal.serviceConfig.Environment = [
    "ET_NO_TELEMETRY=1"
  ];

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 2022 ];
}
