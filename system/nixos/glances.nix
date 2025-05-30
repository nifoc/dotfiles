{ config, ... }:

{
  services = {
    glances = {
      enable = true;
      port = 61208;
    };

    nginx.virtualHosts."glances-krypton.internal.kempkens.network" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:${toString config.services.glances.port}";
      };
    };
  };
}
