{
  pkgs,
  lib,
  config,
  ...
}:

lib.mkIf (config.networking.hostName == "boron") {
  services.caddy = {
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/mholt/caddy-l4@v0.0.0-20250530154005-4d3c80e89c5f" ];
      hash = "sha256-O2shDuAA4OjUx44uOxMbd5iQUQVl6GUuFKqv+P/PXNM=";
    };

    virtualHosts."default.kempkens.network" = {
      useACMEHost = "kempkens.network";

      extraConfig = ''
        respond "I'm a teapot" 418
      '';
    };

    globalConfig = ''
      default_sni default.kempkens.network
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
