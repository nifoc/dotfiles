{
  den.aspects.neon.nixos = {
    networking.hostId = "0105164f";

    systemd.network = rec {
      netdevs = {
        "20-vlan51" = {
          netdevConfig = {
            Kind = "vlan";
            Name = "vlan51";
          };
          vlanConfig.Id = 51;
        };

        "30-vlan200" = {
          netdevConfig = {
            Kind = "vlan";
            Name = "vlan200";
          };
          vlanConfig.Id = 200;
        };
      };

      networks = {
        "10-lan" = {
          matchConfig.Name = "end0";
          vlan = [
            "vlan51"
            "vlan200"
          ];
          networkConfig = {
            DHCP = "yes";
            IPv6AcceptRA = true;
            IPv6PrivacyExtensions = true;
          };
          linkConfig.RequiredForOnline = "routable";
        };

        "20-iot" = {
          matchConfig.Name = "vlan51";
          networkConfig = {
            DHCP = "no";
            IPv6AcceptRA = false;
          };
          address = [ "10.0.51.7/24" ];
          linkConfig.RequiredForOnline = "routable";
        };

        "30-dtag" = {
          matchConfig.Name = "vlan200";
          networkConfig = {
            DHCP = "no";
            IPv6AcceptRA = false;
          };
          address = [ "10.0.200.7/24" ];
          linkConfig.RequiredForOnline = "routable";
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-lan".matchConfig.Name}"
      ];
    };
  };
}
