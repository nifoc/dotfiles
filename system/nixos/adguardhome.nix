{
  services.adguardhome = {
    enable = true;

    settings = {
      bind_host = "127.0.0.1";
      bind_port = 3000;

      auth_attempts = 3;
      debug_pprof = false;

      dns = {
        bind_hosts = [ "0.0.0.0" ];
        port = 53;

        bootstrap_dns = [
          "9.9.9.11"
          "149.112.112.11"
          "2620:fe::11"
          "2620:fe::fe:11"
        ];
      };

      tls = {
        enabled = false;
        allow_unencrypted_doh = true;
      };

      dhcp.enabled = false;
    };
  };

  services.nginx.virtualHosts."dns.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:3000";
    };
  };
}
