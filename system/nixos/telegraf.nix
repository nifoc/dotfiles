{
  services.telegraf = {
    enable = true;

    extraConfig = {
      inputs = {
        syslog = {
          server = "udp://:6514";
          syslog_standard = "RFC5424";
          best_effort = true;
        };
      };

      outputs = {
        loki = {
          domain = "http://127.0.0.1:3100";
          endpoint = "/loki/api/v1/push";
          timeout = "15s";
        };
      };
    };
  };

  networking.firewall.interfaces."vlan777".allowedUDPPorts = [ 6514 ];
}
