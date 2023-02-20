{ config, ... }:

{
  services.libreddit = {
    enable = true;

    address = "127.0.0.1";
    port = 8002;
  };

  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;

    virtualHosts."libreddit.only.internal" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      forceSSL = false;
      enableACME = false;
      basicAuthFile = config.age.secrets.libreddit-auth.path;

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8002";
      };
    };
  };
}
