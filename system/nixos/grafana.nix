let
  fqdn = "grafana.internal.kempkens.network";
in
{
  services.grafana = {
    enable = true;

    settings = {
      analytics.reporting_enabled = false;

      server = {
        root_url = "https://${fqdn}";
        domain = fqdn;
        enforce_domain = true;
        enable_gzip = true;
        http_addr = "127.0.0.1";
        http_port = 3099;
      };
    };
  };

  services.nginx.virtualHosts."${fqdn}" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:3099";
      proxyWebsockets = true;
    };
  };
}
