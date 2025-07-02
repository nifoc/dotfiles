{ config, ... }:

let
  fqdn = "feeds.kempkens.io";
in
{
  services = {
    miniflux = {
      enable = true;

      config = {
        LISTEN_ADDR = "127.0.0.1:8016";
        BASE_URL = "https://${fqdn}/";
        POLLING_FREQUENCY = "25";
      };

      adminCredentialsFile = config.age.secrets.miniflux-credentials.path;
    };

    caddy.virtualHosts."${fqdn}" = {
      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

        reverse_proxy ${config.services.miniflux.config.LISTEN_ADDR}
      '';
    };
  };
}
