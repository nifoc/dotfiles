{
  den.aspects.carbon.nixos = {
    networking.hostId = "793c1e05";

    systemd.network = rec {
      networks = {
        "10-wan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "ipv4";
            Address = "2a01:4f8:1c1b:9a20::2/64";
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
