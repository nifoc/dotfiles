{
  services.uptime-kuma = {
    enable = true;
  };

  services.nginx.virtualHosts."kuma.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:3001";
      proxyWebsockets = true;
    };
  };
}
