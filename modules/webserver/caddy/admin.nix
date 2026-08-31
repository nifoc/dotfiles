{ den, ... }:

{
  den.aspects.webserver = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        inherit (cfg.firewall) trustedInterfaces;
      in
      {
        services.caddy.globalConfig = ''
          admin :2019
        '';

        networking.firewall.interfaces = builtins.listToAttrs (
          lib.map (iface: {
            name = iface;
            value = {
              allowedTCPPorts = [ 2019 ];
            };
          }) trustedInterfaces
        );
      };
  };
}
