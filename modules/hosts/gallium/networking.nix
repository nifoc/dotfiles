{
  den.aspects.gallium.nixos = {
    networking.hostId = "dc0bfe0a";

    systemd.network = rec {
      networks = {
        "10-wan" = {
          matchConfig.Name = "eth0";
          DHCP = "no";
          address = [
            "77.90.42.205/32"
            "2a06:de00:401:924c::1/128"
          ];
          dns = [
            "37.221.95.95"
            "43.251.160.187"
            "2a14:1ec1::"
            "2a06:de00:400::"
          ];
          routes = [
            {
              Destination = "::/0";
              Gateway = "2a06:de00:401::";
              GatewayOnLink = true;
            }
            {
              Destination = "0.0.0.0/0";
              Gateway = "37.114.36.0";
              GatewayOnLink = true;
            }
          ];
          linkConfig.RequiredForOnline = "routable";
        };
      };

      wait-online.extraArgs = [
        "--interface=${networks."10-wan".matchConfig.Name}"
      ];
    };
  };
}
