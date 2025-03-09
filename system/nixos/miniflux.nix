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

    nginx.virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "kempkens.io";

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8016";
      };
    };
  };
}
