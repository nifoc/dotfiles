{ config, secret, ... }:

{
  services.libreddit = {
    enable = true;

    address = "127.0.0.1";
    port = 8002;
  };

  services.nginx.virtualHosts."${secret.nginx.hostnames.libreddit}" = {
    listenAddresses = [ "100.113.242.85" "[fd7a:115c:a1e0:ab12:4843:cd96:6271:f255]" ];
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8002";
    };
  };
}
