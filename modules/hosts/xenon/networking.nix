{
  den.aspects.xenon.nixos = {
    networking.hostId = "b09ca5ca";

    systemd.network = rec {
      netdevs = {
        "20-vlan50" = {
          netdevConfig = {
            Kind = "vlan";
            Name = "vlan50";
          };
          vlanConfig.Id = 50;
        };
      };

      networks = {
        "10-lan" = {
          matchConfig.Name = "eth0";
          vlan = [
            "vlan50"
          ];
          networkConfig = {
            DHCP = "yes";
            IPv6AcceptRA = true;
            IPv6PrivacyExtensions = true;
          };
          linkConfig.RequiredForOnline = "routable";
        };

        "20-security" = {
          matchConfig.Name = "vlan50";
          networkConfig = {
            DHCP = "no";
            IPv6AcceptRA = false;
          };
          address = [ "10.0.50.101/24" ];
          linkConfig.RequiredForOnline = "routable";
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-lan".matchConfig.Name}"
      ];
    };
  };
}
