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

      https_only = true;

      statistics_enabled = false;

      registration_enabled = false;
      login_enabled = true;
      captcha_enabled = false;
      admins = [ "daniel" ];

      use_pubsub_feeds = false;
    };

    nginx.enable = false;
  };

  services.nginx.virtualHosts."${fqdn}" = {
    listenAddresses = [ "100.113.242.85" ];
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8007";
    };
  };
}
