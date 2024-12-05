{ pkgs, lib, config, ... }:

let
  web-domain = "mastodon.kempkens.io";

  pkg-base = pkgs.mastodon;

  pkg-mastodon = pkg-base.overrideAttrs (_: {
    mastodonModules = pkg-base.mastodonModules.overrideAttrs (oldMods:
      let
        tangerine-ui = pkgs.fetchFromGitHub {
          owner = "nileane";
          repo = "TangerineUI-for-Mastodon";
          rev = "v2.3";
          hash = "sha256-Yl5UOjcp0Q3WpiLgfjQFVVEQs4WlVUSBCS7kuO+39wQ=";
        };
      in
      {
        pname = "${oldMods.pname}+themes";

        postPatch = ''
          styleDir=$PWD/app/javascript/styles

          cp -r ${tangerine-ui}/mastodon/app/javascript/styles/* $styleDir

          echo "tangerineui: styles/tangerineui.scss" >>$PWD/config/themes.yml
          echo "tangerineui-purple: styles/tangerineui-purple.scss" >>$PWD/config/themes.yml
          echo "tangerineui-cherry: styles/tangerineui-cherry.scss" >>$PWD/config/themes.yml
          echo "tangerineui-lagoon: styles/tangerineui-lagoon.scss" >>$PWD/config/themes.yml
        '';
      });

    nativeBuildInputs = [ pkgs.yq-go ];

    postBuild = ''
      # Make theme available
      echo "tangerineui: styles/tangerineui.scss" >>$PWD/config/themes.yml
      echo "tangerineui-purple: styles/tangerineui-purple.scss" >>$PWD/config/themes.yml
      echo "tangerineui-cherry: styles/tangerineui-cherry.scss" >>$PWD/config/themes.yml
      echo "tangerineui-lagoon: styles/tangerineui-lagoon.scss" >>$PWD/config/themes.yml

      yq -i '.en.themes.tangerineui = "Tangerine UI"' $PWD/config/locales/en.yml
      yq -i '.en.themes.tangerineui-purple = "Tangerine UI (Purple)"' $PWD/config/locales/en.yml
      yq -i '.en.themes.tangerineui-cherry = "Tangerine UI (Cherry)"' $PWD/config/locales/en.yml
      yq -i '.en.themes.tangerineui-lagoon = "Tangerine UI (Lagoon)"' $PWD/config/locales/en.yml
    '';
  });
in
{
  services.mastodon = {
    enable = true;

    package = pkg-mastodon;

    configureNginx = false;

    localDomain = "kempkens.io";

    streamingProcesses = 2;
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
      createLocally = true;
    };

    redis = {
      createLocally = true;
    };

    elasticsearch = {
      host = "127.0.0.1";
      port = 9200;
    };

    smtp = {
      createLocally = false;
      authenticate = true;
      host = "smtp.mailgun.org";
      port = 587;
      fromAddress = "mastodon@mg.kempkens.io";
      user = "postmaster@mg.kempkens.io";
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

  # For services that connect to Mastodon 
  systemd.services.mastodon-wait-for-available = {
    description = "Wait for Mastodon to be available";
    after = [ "mastodon-web.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${lib.getExe pkgs.bash} -c 'until ${lib.getExe pkgs.curl} --fail --silent https://${web-domain} > /dev/null; do sleep 1; done'";
    };
  };

  services.nginx = {
    upstreams.mastodon-streaming = {
      extraConfig = ''
        least_conn;
      '';
      servers = builtins.listToAttrs
        (map
          (i: {
            name = "unix:/run/mastodon-streaming/streaming-${toString i}.socket";
            value = { };
          })
          (lib.range 1 config.services.mastodon.streamingProcesses));
    };

    virtualHosts = {
      "${web-domain}" = {
        quic = true;
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
            proxy_hide_header Strict-Transport-Security;
            proxy_force_ranges on;
          '';
        };

        locations."/api/v1/streaming/" = {
          recommendedProxySettings = true;
          proxyPass = "http://mastodon-streaming";
          proxyWebsockets = true;

          extraConfig = ''
            proxy_hide_header Strict-Transport-Security;
            proxy_force_ranges on;
          '';
        };
      };

      "mastodon-cdn.kempkens.io" =
        let
          lib-base = "/var/lib/mastodon/public-system";
        in
        {
          quic = true;
          http3 = true;
          kTLS = true;

          root = "${config.services.mastodon.package}/public/";
          forceSSL = true;
          useACMEHost = "kempkens.io";

          extraConfig = ''
            add_header Access-Control-Allow-Origin https://mastodon.kempkens.io;
            add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
          '';

          locations."/system/" = {
            alias = "${lib-base}/";

            extraConfig = ''
              add_header Cache-Control "public, max-age=2419200, immutable";
              add_header X-Content-Type-Options nosniff;
              add_header Content-Security-Policy "default-src 'none'; form-action 'none'";
            '';
          };

          # "Old" CDN paths
          locations."/accounts/".alias = "${lib-base}/accounts/";
          locations."/cache/".alias = "${lib-base}/cache/";
          locations."/custom_emojis/".alias = "${lib-base}/custom_emojis/";
          locations."/media_attachments/".alias = "${lib-base}/media_attachments/";
        };
    };
  };

  users.groups.mastodon.members = [ config.services.nginx.user ];
}
