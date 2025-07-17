{ lib, config, ... }:

{
  services = {
    tailscaleAuth = {
      enable = true;
    };

    nginx.tailscaleAuth = {
      enable = false;
    };

    caddy.extraConfig = ''
      (tailscale-auth) {
        forward_auth unix/${config.services.tailscaleAuth.socketPath} {
          uri /auth
          header_up Remote-Addr {remote_host}
          header_up Remote-Port {remote_port}
          header_up Original-URI {uri}
          copy_headers {
            Tailscale-User>X-Webauth-User
            Tailscale-Name>X-Webauth-Name
            Tailscale-Login>X-Webauth-Login
            Tailscale-Tailnet>X-Webauth-Tailnet
            Tailscale-Profile-Picture>X-Webauth-Profile-Picture
          }
        }
      }
    '';
  };

  users.users = lib.optionalAttrs config.services.caddy.enable {
    caddy.extraGroups = [ config.services.tailscaleAuth.group ];
  };
}
