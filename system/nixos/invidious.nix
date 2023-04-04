{ config, ... }:

let
  fqdn = "yt.daniel.sx";
in
{
  services.invidious = {
    enable = true;

    domain = fqdn;
    port = 8007;

    database = {
      createLocally = false;
      host = "10.99.99.3";
      port = 5432;
      passwordFile = config.age.secrets.invidious-database-password.path;
    };

    settings = {
      db = {
        user = "invidious";
        dbname = "invidious";
      };

      host_binding = "127.0.0.1";
      external_port = 443;
      https_only = true;

      use_quic = true;

      statistics_enabled = false;

      registration_enabled = false;
      login_enabled = true;
      captcha_enabled = false;
      admins = [ ];

      use_pubsub_feeds = false;
      channel_refresh_interval = "15m";
    };

    nginx.enable = false;
  };

  services.nginx.virtualHosts."${fqdn}" = {
    listenAddresses = [ "100.113.242.85" "[fd7a:115c:a1e0:ab12:4843:cd96:6271:f255]" ];
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8007";
    };
  };
}
