{
  den.aspects.nix-cache = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.niks3;
        fqdn = builtins.replaceStrings [ "https://" ] [ "" ] cfg.cacheUrl;
      in
      {
        services.caddy.virtualHosts."${fqdn}" = {
          extraConfig = ''
            request_body {
              max_size 2GB
            }

            @niks3_api {
              not path /api/*
            }

            basic_auth @niks3_api argon2id "niks3-cache" {
              daniel {$BASIC_AUTH_NIKS3_DANIEL_PASSWORD}
            }

            reverse_proxy ${cfg.httpAddr} {
              flush_interval -1
            }
          '';
        };
      };
  };
}
