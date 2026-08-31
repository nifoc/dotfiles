{ den, ... }:

{
  den.aspects.remote-access = {
    nixos =
      { config, lib, ... }:
      let
        trustedInterfaces = den.aspects.${config.networking.hostName}.meta.firewall.trustedInterfaces;
      in
      {
        services.eternal-terminal = {
          enable = true;

          port = 2022;
        };

        systemd.services.eternal-terminal.serviceConfig.Environment = [
          "ET_NO_TELEMETRY=1"
        ];

        networking.firewall.interfaces = builtins.listToAttrs (
          lib.map (iface: {
            name = iface;
            value = {
              allowedTCPPorts = [ 2022 ];
            };
          }) trustedInterfaces
        );
      };
  };
}
