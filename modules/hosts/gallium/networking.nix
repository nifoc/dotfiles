{
  den.aspects.gallium.nixos = {
    networking.hostId = "dc0bfe0a";

    systemd.network = {
      networks = {
        "10-wan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "ipv4";
            Address = "2001:41d0:701:1000::3ee7/64";
            Gateway = "2001:41d0:701:1000::1";
          };
          linkConfig.RequiredForOnline = "routable";
        };

        "20-lan" = {
          matchConfig.Name = "ens4";
          networkConfig = {
            DHCP = "yes";
          };
          linkConfig.RequiredForOnline = "routable";
        };
      };
    };
  };
}
