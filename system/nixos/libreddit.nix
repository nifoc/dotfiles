{ config, secret, ... }:

{
  services.libreddit = {
    enable = true;

    address = "127.0.0.1";
    port = 8002;
  };

  services.nginx.virtualHosts."${secret.nginx.hostnames.libreddit}" = {
    http3 = true;

    forceSSL = true;
    useACMEHost = "daniel.sx";
    basicAuthFile = config.age.secrets.libreddit-auth.path;

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8002";
    };
  };
}
