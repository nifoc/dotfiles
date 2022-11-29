{ config, secret, ... }:

let
  web-domain = "mastodon.kempkens.io";
in
{
  services.mastodon = {
    enable = true;

    configureNginx = false;

    localDomain = "kempkens.io";

    streamingPort = 55000;
    webPort = 55001;
    sidekiqPort = 55002;
    enableUnixSocket = false;

    trustedProxy = "127.0.0.1";

    vapidPublicKeyFile = "/var/lib/mastodon/secrets/vapid-public-key";
    secretKeyBaseFile = "/var/lib/mastodon/secrets/secret-key-base";
    otpSecretFile = "/var/lib/mastodon/secrets/otp-secret";
    vapidPrivateKeyFile = "/var/lib/mastodon/secrets/vapid-private-key";

    database = {
      createLocally = false;
      host = "10.99.99.3";
      port = 5432;
      name = "mastodon";
      inherit (secret.mastodon.database) user;
      inherit (secret.mastodon.database) passwordFile;
    };

    redis = {
      createLocally = false;
      host = "10.99.99.3";
      port = 6379;
    };

    elasticsearch.host = null;

    smtp = {
      createLocally = false;
      authenticate = true;
      host = "smtp.mailgun.org";
      port = 465;
      fromAddress = "mastodon@mg.kempkens.io";
      inherit (secret.mastodon.smtp) user;
      inherit (secret.mastodon.smtp) passwordFile;
    };

    automaticMigrations = true;

    mediaAutoRemove = {
      enable = true;
      startAt = "daily";
      olderThanDays = 21;
    };

    extraConfig = {
      WEB_DOMAIN = web-domain;
      LOCAL_HTTPS = true;
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."${web-domain}" = {
      root = "${config.services.mastodon.package}/public/";
      forceSSL = false;
      enableACME = false;

      locations."/system/".alias = "/var/lib/mastodon/public-system/";

      locations."/" = {
        tryFiles = "$uri @proxy";
      };

      locations."@proxy" = {
        proxyPass = "http://127.0.0.1:55001";
        proxyWebsockets = true;
      };

      locations."/api/v1/streaming/" = {
        proxyPass = "http://127.0.0.1:55000";
        proxyWebsockets = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
