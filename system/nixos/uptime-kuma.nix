{ config, ... }:

{
  services = {
    uptime-kuma = {
      enable = true;
    };

    caddy.virtualHosts."kuma.internal.kempkens.network" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

        reverse_proxy ${config.services.uptime-kuma.settings.HOST}:${config.services.uptime-kuma.settings.PORT}
      '';
    };
  };
}
