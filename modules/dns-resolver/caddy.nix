{ den, ... }:

{
  den.aspects.dns-resolver = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        localAccess = (cfg.dns-resolver.localAccess or true);

        blockyCfg = config.services.blocky.settings;
      in
      {
        services = lib.mkIf localAccess {
          caddy = {
            virtualHosts."dns.internal.kempkens.network" = {
              serverAliases = [ "dns-${config.networking.hostName}.internal.kempkens.network" ];

              extraConfig = ''
                encode

                header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

                @blocky {
                  path /dns-query
                  path /dns-query/*
                  path /metrics
                }

                reverse_proxy @blocky ${builtins.head blockyCfg.ports.http} 
              '';
            };
          };
        };
      };
  };
}
