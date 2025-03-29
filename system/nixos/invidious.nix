{ config, ... }:

let
  fqdn = "yt.daniel.sx";
in
{
  services.invidious = {
    enable = true;

    domain = fqdn;
    address = "127.0.0.1";
    port = 8007;

    database = {
      createLocally = true;
    };

    settings = {
      db = {
        user = "invidious";
        dbname = "invidious";
      };

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

    extraSettingsFile = config.age.secrets.invidious-extra-settings.path;

    nginx.enable = false;
  };

  services.nginx.virtualHosts."${fqdn}" = {
    listenAddresses = [
      "100.122.253.109"
      "[fd7a:115c:a1e0::3a01:fd6d]"
    ];
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
