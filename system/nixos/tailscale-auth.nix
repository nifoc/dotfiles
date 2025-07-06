{ lib, config, ... }:

{
  services = {
    tailscaleAuth = {
      enable = true;
    };

    nginx.tailscaleAuth = {
      enable = false;
    };
  };

  users.users = lib.optionalAttrs config.services.caddy.enable {
    caddy.extraGroups = [ config.services.tailscaleAuth.group ];
  };
}
