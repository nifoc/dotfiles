{ config, lib, ... }:

{
  services = {
    tailscaleAuth = {
      enable = true;
    };

    nginx.tailscaleAuth = {
      enable = true;
    };

    nginx.virtualHosts = lib.genAttrs config.services.nginx.tailscaleAuth.virtualHosts (vhost: {
      locations."/auth" = {
        extraConfig = lib.mkAfter ''
          # Skipping auth for ${vhost} for certain clients
          if ($tailscale_auth_skip = yes) {
            return 200;
          }
        '';
      };
    });
  };
}
