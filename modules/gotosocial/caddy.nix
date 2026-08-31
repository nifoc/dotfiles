{
  den.aspects.gotosocial = {
    nixos =
      { config, ... }:
      let
        gtsCfg = config.services.gotosocial.settings;
      in
      {
        services.caddy.virtualHosts = {
          "${gtsCfg.host}" = {
            extraConfig = ''
              encode

              request_body {
                max_size 40MB
              }

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy ${gtsCfg.bind-address}:${toString gtsCfg.port} {
                flush_interval -1
              }
            '';
          };
        };
      };
  };
}
