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

        # Use the old default for now
        security.secret_key = "SW2YcwTIb9zpOOhoPsMm";

        server = {
          root_url = "https://${fqdn}";
          domain = fqdn;
          enforce_domain = true;
          http_addr = "127.0.0.1";
          http_port = 3099;
        };
      };
    };

    caddy.virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        reverse_proxy ${config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}
      '';
    };
  };
}
