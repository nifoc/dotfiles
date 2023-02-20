{ config, secret, ... }:

let
  web-domain = "mastodon.kempkens.io";

  nginx-extra-proxy-settings = ''
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $http_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
    proxy_set_header X-Forwarded-Host $host;
    proxy_set_header X-Forwarded-Server $host;

    proxy_force_ranges on;
  '';
in
{
  services.mastodon = {
    enable = true;

    configureNginx = false;

    localDomain = "kempkens.io";

    streamingPort = 55000;
    webPort = 55001;
    sidekiqPort = 55002;
    enableUnixSocket = true;

    sidekiqThreads = 12;

    trustedProxy = "127.0.0.1";

    vapidPublicKeyFile = config.age.secrets.mastodon-vapid-public-key.path;
    secretKeyBaseFile = config.age.secrets.mastodon-secret-key-base.path;
    otpSecretFile = config.age.secrets.mastodon-otp-secret.path;
    vapidPrivateKeyFile = config.age.secrets.mastodon-vapid-private-key.path;

    database = {
      createLocally = false;
      host = "10.99.99.3";
      port = 5432;
      name = "mastodon";
      inherit (secret.mastodon.database) user;
      passwordFile = config.age.secrets.mastodon-database-password.path;
    };

    redis = {
      createLocally = false;
      host = "10.99.99.3";
      port = 6379;
    };

    elasticsearch = {
      host = "10.99.99.3";
      port = 9200;
    };

    smtp = {
      createLocally = false;
      authenticate = true;
      host = "smtp.mailgun.org";
      port = 587;
      fromAddress = "mastodon@mg.kempkens.io";
      inherit (secret.mastodon.smtp) user;
      passwordFile = config.age.secrets.mastodon-smtp-password.path;
    };

    automaticMigrations = true;

    mediaAutoRemove = {
      enable = true;
      startAt = "daily";
      olderThanDays = 14;
    };

    extraConfig = {
      WEB_DOMAIN = web-domain;
    };

    extraEnvFiles = [ config.age.secrets.mastodon-extra-config.path ];
  };

  services.nginx = {
    enable = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;

    virtualHosts."${web-domain}" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      root = "${config.services.mastodon.package}/public/";
      forceSSL = false;
      enableACME = false;

      locations."/system/" = {
        extraConfig = ''
          rewrite ^/system/?(.*)$ https://mastodon-cdn.kempkens.io/$1 permanent;
        '';
      };

      locations."/" = {
        tryFiles = "$uri @proxy";
      };

      locations."@proxy" = {
        proxyPass = "http://unix:/run/mastodon-web/web.socket";
        proxyWebsockets = true;
        extraConfig = nginx-extra-proxy-settings;
      };

      locations."/api/v1/streaming/" = {
        proxyPass = "http://unix:/run/mastodon-streaming/streaming.socket";
        proxyWebsockets = true;
        extraConfig = nginx-extra-proxy-settings;
      };
    };
  };

  users.groups.mastodon.members = [ config.services.nginx.user ];
}
