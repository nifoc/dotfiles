{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.xmpp-server = {
    nixos =
      { config, lib, ... }:
      let
        xmppCfg = den.aspects.${config.networking.hostName}.meta.xmpp-server;

        inherit (xmppCfg) domain;
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
        ];

        age.secrets = {
          xmpp-server-coturn-static-auth = {
            file = ../../agenix/xmpp-server/coturn/static-auth.age;
            owner = "turnserver";
            group = "turnserver";
          };
        };

        services.coturn = {
          enable = true;
          listening-ips = [
            "127.0.0.1"
            "::1"
            "49.12.228.29"
            "2a01:4f8:1c1b:9a20::2"
          ];
          use-auth-secret = true;
          static-auth-secret-file = config.age.secrets.xmpp-server-coturn-static-auth.path;
          realm = "turn.${domain}";

          cert = "/var/lib/coturn/fullchain.pem";
          pkey = "/var/lib/coturn/key.pem";

          min-port = 65000;
          max-port = 65535;

          no-cli = true;
        };

        systemd.tmpfiles.rules = [
          "d /var/lib/coturn 0750 turnserver turnserver"
        ];

        networking.firewall.interfaces =
          let
            interfaces = lib.mapAttrsToList (
              _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
            ) config.systemd.network.networks;

            ports = [
              config.services.coturn.listening-port
              config.services.coturn.alt-listening-port
              config.services.coturn.tls-listening-port
              config.services.coturn.alt-tls-listening-port
            ];
          in
          builtins.listToAttrs (
            builtins.map (iface: {
              name = iface;
              value = {
                allowedTCPPorts = ports;
                allowedUDPPorts = ports;
                allowedUDPPortRanges = [
                  {
                    from = config.services.coturn.min-port;
                    to = config.services.coturn.max-port;
                  }
                ];
              };
            }) (builtins.filter builtins.isString interfaces)
          );
      };
  };
}
