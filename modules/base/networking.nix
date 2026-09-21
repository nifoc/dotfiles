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
            "100.74.151.110"
            "fd7a:115c:a1e0::8d2b:976f"
          ];

          gerdas-iphone = [
            "100.113.44.54"
            "fd7a:115c:a1e0::322b:2c37"
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
