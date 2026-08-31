{
  den.aspects.webdav-server = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.webdav.settings;
      in
      {
        services.caddy.virtualHosts."diarium.internal.kempkens.network" = {
          extraConfig = ''
            encode

            @has_dest header_regexp dest ^https?://[^/]+(.*)$
            header @has_dest Destination {re.dest.1}

            request_body {
              max_size 128MB
            }

            reverse_proxy ${cfg.address}:${toString cfg.port} {
              header_up X-Real-IP {remote_host}
              header_up REMOTE-HOST {remote_host}
            }
          '';
        };
      };
  };
}
