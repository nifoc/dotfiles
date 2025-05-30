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
      "${vhost}".locations."/auth" = {
        extraConfig = lib.mkAfter ''
          if ($tailscale_auth_skip = yes) {
            return 200;
          }
        '';
      };
    });
  };
}
