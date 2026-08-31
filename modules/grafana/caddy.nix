{
  den.aspects.grafana = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.grafana.settings.server;
      in
      {
        services.caddy.virtualHosts."${cfg.domain}" = {
          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            reverse_proxy ${cfg.http_addr}:${toString cfg.http_port}
          '';
        };
      };
  };
}
