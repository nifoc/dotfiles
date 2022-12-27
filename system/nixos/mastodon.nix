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
      inherit (secret.mastodon.smtp) passwordFile;
    };

    automaticMigrations = true;

    mediaAutoRemove = {
      enable = true;
      startAt = "daily";
      olderThanDays = 14;
    };

    extraConfig = {
      WEB_DOMAIN = web-domain;

      ES_USER = secret.mastodon.elasticsearch.user;
      ES_PASS = secret.mastodon.elasticsearch.password;

      S3_ENABLED = "true";
      S3_BUCKET = secret.mastodon.s3.bucket;
      AWS_ACCESS_KEY_ID = secret.mastodon.s3.accessKeyId;
      AWS_SECRET_ACCESS_KEY = secret.mastodon.s3.secretAccessKey;
      S3_PROTOCOL = "https";
      S3_REGION = secret.mastodon.s3.region;
      S3_ENDPOINT = secret.mastodon.s3.endpoint;
      S3_ALIAS_HOST = "mastodon-cdn.kempkens.io";
      S3_HOSTNAME = "mastodon-cdn.kempkens.io";
    };
  };

  services.nginx = {
    enable = true;
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
        return = "301 https://mastodon-cdn.kempkens.io$request_uri";
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
