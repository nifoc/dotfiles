{
  den.aspects.libretranslate = {
    nixos =
      { config, ... }:
      let
        cfg = config.services.libretranslate;
      in
      {
        services.caddy.virtualHosts."${cfg.domain}" = {
          extraConfig = ''
            encode

            header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

            @static {
              path /favicon.ico
              path /static/*
            }

            handle @static {
              uri strip_prefix /static

              root * ${cfg.package.static-compressed}/share/libretranslate/static
              file_server {
                precompressed
              }
            }

            handle {
              reverse_proxy ${cfg.host}:${toString cfg.port}
            }
          '';
        };
      };
  };
}
