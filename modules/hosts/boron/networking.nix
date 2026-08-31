{
  den.aspects.boron.nixos = {
    networking.hostId = "0bf41532";

    systemd.network = rec {
      networks = {
        "10-wan" = {
          matchConfig.Name = "eth0";
          networkConfig = {
            DHCP = "ipv4";
            Address = "2a01:4f8:1c1c:d840::2/64";
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
