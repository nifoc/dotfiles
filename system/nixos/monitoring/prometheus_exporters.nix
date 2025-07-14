{ config, lib, ... }:

let
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

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [
    config.services.prometheus.exporters.node.port
  ] ++ optional config.services.smartd.enable config.services.prometheus.exporters.smartctl.port;
}
