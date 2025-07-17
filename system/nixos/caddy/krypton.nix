{
  lib,
  config,
  ...
}:

lib.mkIf (config.networking.hostName == "krypton") {
  services.caddy = {
    virtualHosts."*.internal.kempkens.network" = {
      extraConfig = ''
        respond "I'm a teapot" 418
      '';
    };

    globalConfig = ''
      default_sni default-${config.networking.hostName}.internal.kempkens.network
    '';
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
