{
  services.atuin = {
    enable = true;

    host = "127.0.0.1";
    port = 8015;
    openRegistration = false;
    openFirewall = false;
  };

  services.nginx.virtualHosts."atuin-sync.kempkens.io" = {
    listenAddresses = [ "100.64.10.2" "[fd7a:115c:a1e0:1010::2]" ];
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "kempkens.io";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8015";
    };
  };
}
