{
  den.aspects.silicon.nixos = {
    networking.hostId = "b799c6b9";

    systemd.network = rec {
      networks = {
        "10-wan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "ipv4";
            Address = "2a0a:4cc0:100:f22::2/64";
            Gateway = "fe80::1";
          };
          linkConfig.RequiredForOnline = "routable";
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-wan".matchConfig.Name}"
      ];
    };
  };
}
