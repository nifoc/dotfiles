{
  config,
  lib,
  domain,
  ...
}:

{
  services.coturn = {
    enable = true;
    listening-ips = [
      "127.0.0.1"
      "::1"
      "49.12.228.29"
      "2a01:4f8:1c1b:9a20::2"
    ];
    use-auth-secret = true;
    static-auth-secret-file = config.age.secrets.coturn-static-auth.path;
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
}
