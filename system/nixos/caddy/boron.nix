{
  lib,
  config,
  ...
}:

lib.mkIf (config.networking.hostName == "boron") {
  services = {
    caddy = {
      virtualHosts."*.kempkens.network" = {
        extraConfig = ''
          respond "I'm a teapot" 418
        '';
      };

      globalConfig = ''
        default_sni default.kempkens.network
      '';
    };

    postgresql = {
      authentication = ''
        host caddy_storage caddy_storage 100.88.88.45/32 md5
        host caddy_storage caddy_storage 100.90.7.38/32 md5
        host caddy_storage caddy_storage 100.97.247.57/32 md5
        host caddy_storage caddy_storage 100.83.191.69/32 md5
        host caddy_storage caddy_storage 100.126.68.56/32 md5
      '';
    };
  };

  networking.firewall.interfaces =
    let
      interfaces =
        lib.mapAttrsToList (
          _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
        ) config.systemd.network.networks
        ++ [ "tailscale0" ];
    in
    builtins.listToAttrs (
      builtins.map (iface: {
        name = iface;
        value = {
          allowedTCPPorts = [
            80
            443
          ];
          allowedUDPPorts = [ 443 ];
        };
      }) (builtins.filter builtins.isString interfaces)
    );
}
