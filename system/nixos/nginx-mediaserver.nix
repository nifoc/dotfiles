{ lib, config, ... }:

{
  services.nginx.virtualHosts."default.internal.kempkens.network" = {
    listen = [
      {
        addr = "0.0.0.0";
        port = 443;
        ssl = true;
        extraParameters = [
          "fastopen=63"
          "backlog=1023"
          "deferred"
        ];
      }

      {
        addr = "[::0]";
        port = 443;
        ssl = true;
        extraParameters = [
          "fastopen=63"
          "backlog=1023"
          "deferred"
        ];
      }
    ];

    default = true;
    quic = false;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      return = "418";
    };
  };

  networking.firewall.interfaces =
    let
      interfaces = lib.mapAttrsToList (_: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null) config.systemd.network.networks ++ [ "tailscale0" ];
    in
    builtins.listToAttrs
      (builtins.map
        (iface:
          {
            name = iface;
            value = {
              allowedTCPPorts = [ 80 443 ];
              allowedUDPPorts = [ 443 ];
            };
          })
        (builtins.filter builtins.isString interfaces));
}
