{
  services.atuin = {
    enable = true;

    host = "127.0.0.1";
    port = 8015;
    openRegistration = false;
    openFirewall = false;
  };

  services.nginx.virtualHosts."atuin-sync.kempkens.io" = {
    listenAddresses = [ "100.108.165.26" "[fd7a:115c:a1e0:ab12:4843:cd96:626c:a51a]" ];
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
