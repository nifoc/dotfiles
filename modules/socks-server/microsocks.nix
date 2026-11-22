{ den, ... }:

{
  den.aspects.socks-server = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;

        networkConfig = cfg.networking;
        trustedInterfaces = cfg.firewall.trustedInterfaces;
      in
      {
        services.microsocks = {
          enable = true;

          ip = networkConfig.tailscale.ipv4;
          outgoingBindIp = networkConfig.default.ipv4;

          disableLogging = true;
        };

        systemd.services.microsocks = lib.mkIf config.services.tailscale.enable {
          requires = lib.mkAfter [ "tailscale-online.target" ];
          after = lib.mkAfter [ "tailscale-online.target" ];
        };

        networking.firewall.interfaces = builtins.listToAttrs (
          lib.map (iface: {
            name = iface;
            value = {
              allowedTCPPorts = [ 1080 ];
            };
          }) trustedInterfaces
        );
      };
  };
}
