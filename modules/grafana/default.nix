{
  den.aspects.grafana = {
    nixos =
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
        };
      };
  };
}
