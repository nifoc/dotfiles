{ den, ... }:

{
  den.aspects.base = {
    meta = {
      networking.ips = {
        lan = {
          # Devices
          daniels-iphone = [ "10.0.0.203" ];

          gerdas-iphone = [ "10.0.0.202" ];

          udos-iphone = [ "10.0.0.201" ];
        };

        tailscale = {
          # Servers
          xenon = [
            "100.124.128.35"
            "fd7a:115c:a1e0::4e34:8023"
          ];

          # Devices
          daniels-iphone = [
            "100.90.174.92"
            "fd7a:115c:a1e0::2a01:ae5c"
          ];

          gerdas-iphone = [
            "100.78.64.102"
            "fd7a:115c:a1e0::fa34:4066"
          ];

          udos-iphone = [
            "100.70.47.57"
            "fd7a:115c:a1e0::5d34:2f39"
          ];
        };
      };
    };

    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta.networking;
      in
      {
        networking = {
          useNetworkd = true;
        };

        systemd.network = {
          enable = true;
        };

        services.udev.extraRules = ''
          ATTR{address}=="${cfg.default.mac}", NAME="${cfg.default.name}"
        '';
      };
  };
}
