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

  services.nginx.virtualHosts."${web-domain}" = {
    http3 = true;

    root = "${config.services.mastodon.package}/public/";
    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations."/system/" = {
      extraConfig = ''
        rewrite ^/system/?(.*)$ https://mastodon-cdn.kempkens.io/$1 permanent;
      '';
    };

    locations."/" = {
      tryFiles = "$uri @proxy";
    };

    locations."@proxy" = {
      recommendedProxySettings = true;
      proxyPass = "http://unix:/run/mastodon-web/web.socket";
      proxyWebsockets = true;

      extraConfig = ''
        proxy_force_ranges on;
      '';
    };

    locations."/api/v1/streaming/" = {
      recommendedProxySettings = true;
      proxyPass = "http://unix:/run/mastodon-streaming/streaming.socket";
      proxyWebsockets = true;

      extraConfig = ''
        proxy_force_ranges on;
      '';
    };
  };

  services.nginx.virtualHosts."mastodon-cdn.kempkens.io" = {
    http3 = true;

    root = "${config.services.mastodon.package}/public/";
    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      add_header Access-Control-Allow-Origin https://mastodon.kempkens.io;
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations."/system/".alias = "/var/lib/mastodon/public-system/";

    # "Old" CDN paths
    locations."/accounts/".alias = "/var/lib/mastodon/public-system/accounts/";
    locations."/cache/".alias = "/var/lib/mastodon/public-system/cache/";
    locations."/custom_emojis/".alias = "/var/lib/mastodon/public-system/custom_emojis/";
    locations."/media_attachments/".alias = "/var/lib/mastodon/public-system/media_attachments/";
  };

  users.groups.mastodon.members = [ config.services.nginx.user ];
}
