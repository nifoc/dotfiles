{
  den.aspects.krypton.nixos = {
    networking.hostId = "364b4220";

    systemd.network = rec {
      netdevs = {
        "20-vlan200" = {
          netdevConfig = {
            Kind = "vlan";
            Name = "vlan200";
          };
          vlanConfig.Id = 200;
        };
      };

      networks = {
        "10-lan" = {
          matchConfig.Name = "eth0";
          vlan = [
            "vlan200"
          ];
          networkConfig = {
            DHCP = "yes";
            IPv6AcceptRA = true;
            IPv6PrivacyExtensions = true;
          };
          linkConfig.RequiredForOnline = "routable";
        };

        "20-dtag" = {
          matchConfig.Name = "vlan200";
          networkConfig = {
            DHCP = "no";
            IPv6AcceptRA = false;
          };
          linkConfig.ActivationPolicy = "down";
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-lan".matchConfig.Name}"
      ];
    };
  };
}
