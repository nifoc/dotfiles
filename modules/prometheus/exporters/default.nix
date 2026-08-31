{ den, ... }:

{
  den.aspects.prometheus.provides.exporters = {
    nixos =
      { config, lib, ... }:
      let
        trustedInterfaces = den.aspects.${config.networking.hostName}.meta.firewall.trustedInterfaces;

        inherit (lib) mkIf optional;
      in
      {
        services.prometheus.exporters = {
          node = {
            enable = true;
          };

          smartctl = mkIf config.services.smartd.enable {
            enable = true;
          };
        };

        networking.firewall.interfaces = builtins.listToAttrs (
          lib.map (iface: {
            name = iface;
            value = {
              allowedTCPPorts = [
                config.services.prometheus.exporters.node.port
              ]
              ++ optional config.services.smartd.enable config.services.prometheus.exporters.smartctl.port;
            };
          }) trustedInterfaces
        );
      };
  };
}
