{ pkgs, lib, config, ... }:

let
  web-domain = "mastodon.kempkens.io";

  pkg-mastodon = pkgs.mastodon.overrideAttrs (_: {
    mastodonModules = pkgs.mastodon.mastodonModules.overrideAttrs (oldMods:
      let
        # https://github.com/ronilaukkarinen/mastodon-bird-ui
        birdui-version = "1.8.2";

        birdui-single-column = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/ronilaukkarinen/mastodon-bird-ui/${birdui-version}/layout-single-column.css";
          sha256 = "0xlnykliqm7qrkw6ym14mxdvx3mb1mmyvjyq7ly32kkx3i2mcc47";
        };

        birdui-multi-column = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/ronilaukkarinen/mastodon-bird-ui/${birdui-version}/layout-multiple-columns.css";
          sha256 = "0wz0kj3p1sa7lf00qj6l83hnl42zrfkb90s085m0q896hy42za9i";
        };
      in
      {
        pname = "${oldMods.pname}+themes";

        postPatch = ''
          # Import theme
          styleDir=$PWD/app/javascript/styles
          birduiDir=$styleDir/mastodon-bird-ui

          mkdir -p $birduiDir
          cat ${birdui-single-column} >$birduiDir/layout-single-column.scss
          cat ${birdui-multi-column} >$birduiDir/layout-multiple-columns.scss

          sed -i 's/theme-contrast/theme-mastodon-bird-ui-contrast/g' $birduiDir/layout-single-column.scss
          sed -i 's/theme-mastodon-light/theme-mastodon-bird-ui-light/g' $birduiDir/layout-single-column.scss

          sed -i 's/theme-contrast/theme-mastodon-bird-ui-contrast/g' $birduiDir/layout-multiple-columns.scss
          sed -i 's/theme-mastodon-light/theme-mastodon-bird-ui-light/g' $birduiDir/layout-multiple-columns.scss

          echo -e "@import 'contrast/variables';\n@import 'application';\n@import 'contrast/diff';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" >$styleDir/mastodon-bird-ui-contrast.scss

          echo -e "@import 'mastodon-light/variables';\n@import 'application';\n@import 'mastodon-light/diff';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" >$styleDir/mastodon-bird-ui-light.scss

          echo -e "@import 'application';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" >$styleDir/mastodon-bird-ui-dark.scss

          # Build theme
          echo "mastodon-bird-ui-dark: styles/mastodon-bird-ui-dark.scss" >>$PWD/config/themes.yml
          echo "mastodon-bird-ui-light: styles/mastodon-bird-ui-light.scss" >>$PWD/config/themes.yml
          echo "mastodon-bird-ui-contrast: styles/mastodon-bird-ui-contrast.scss" >>$PWD/config/themes.yml
        '';
      });

    nativeBuildInputs = [ pkgs.yq-go ];

    postBuild = ''
      # Make theme available
      echo "mastodon-bird-ui-dark: styles/mastodon-bird-ui-dark.scss" >>$PWD/config/themes.yml
      echo "mastodon-bird-ui-light: styles/mastodon-bird-ui-light.scss" >>$PWD/config/themes.yml
      echo "mastodon-bird-ui-contrast: styles/mastodon-bird-ui-contrast.scss" >>$PWD/config/themes.yml

      yq -i '.en.themes.mastodon-bird-ui-dark = "Mastodon Bird UI (Dark)"' $PWD/config/locales/en.yml
      yq -i '.en.themes.mastodon-bird-ui-light = "Mastodon Bird UI (Light)"' $PWD/config/locales/en.yml
      yq -i '.en.themes.mastodon-bird-ui-contrast = "Mastodon Bird UI (High contrast)"' $PWD/config/locales/en.yml
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
