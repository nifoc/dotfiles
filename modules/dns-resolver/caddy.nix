{ den, ... }:

{
  den.aspects.dns-resolver = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        localAccess = (cfg.dns-resolver.localAccess or true);
      in
      {
        services = lib.mkIf localAccess {
          doh-proxy-rust = {
            enable = config.services.caddy.enable;
            flags = [
              "--listen-address=127.0.0.1:8053"
              "--server-address=::1:53"
            ];
          };

          caddy = {
            virtualHosts."dns.internal.kempkens.network" = {
              serverAliases = [ "dns-${config.networking.hostName}.internal.kempkens.network" ];

              extraConfig = ''
                encode

                header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

                @knot_doh {
                  path /dns-query
                }

                @knot_metrics {
                  path /metrics
                  path /metrics/*
                }

                reverse_proxy @knot_doh 127.0.0.1:8053 {
                  flush_interval -1
                }

                reverse_proxy @knot_metrics 127.0.0.1:8853
              '';
            };
          };
        };
      };
  };
}
