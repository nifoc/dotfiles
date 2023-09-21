{ secret, ... }:

{
  services.libreddit = {
    enable = true;

    address = "127.0.0.1";
    port = 8002;
  };

  services.nginx.virtualHosts."${secret.nginx.hostnames.libreddit}" = {
    # listen = [
    #   {
    #     addr = "100.64.10.2";
    #     port = 443;
    #     ssl = true;
    #     extraParameters = [
    #       "fastopen=63"
    #       "backlog=1023"
    #       "deferred"
    #     ];
    #   }
    #
    #   {
    #     addr = "[fd7a:115c:a1e0:1010::2]";
    #     port = 443;
    #     ssl = true;
    #     extraParameters = [
    #       "fastopen=63"
    #       "backlog=1023"
    #     ];
    #   }
    # ];

    listenAddresses = [ "100.64.10.2" "[fd7a:115c:a1e0:1010::2]" ];

    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8002";
    };
  };
}
