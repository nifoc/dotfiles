{ config, ... }:

let
  fqdn = "grafana.internal.kempkens.network";
in
{
  services = {
    grafana = {
      enable = true;

      settings = {
        analytics.reporting_enabled = false;

        server = {
          root_url = "https://${fqdn}";
          domain = fqdn;
          enforce_domain = true;
          http_addr = "127.0.0.1";
          http_port = 3099;
        };

        "auth.proxy" = {
          enabled = true;
          header_name = "X-Webauth-User";
          header_property = "username";
          auto_sign_up = true;
          sync_ttl = 60;
          whitelist = "127.0.0.1";
          headers = "Name:X-Webauth-Name";
          enable_login_token = true;
        };
      };
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

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

        reverse_proxy ${config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}
      '';
    };
  };
}
