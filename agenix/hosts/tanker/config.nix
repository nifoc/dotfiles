{
  age.secrets = {
    nix-netrc = {
      file = ../all/nix/netrc.age;
      path = "/etc/nix/netrc";
      mode = "444";
    };

    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    msmtp-password = {
      file = ./msmtp/password.age;
      mode = "444";
    };

    atticd-environment = {
      file = ./atticd/environment.age;
    };

    fedifetcher-config = {
      file = ./fedifetcher/config.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    # headscale-database-password = {
    #   file = ./headscale/dbPassword.age;
    #   owner = "headscale";
    #   group = "headscale";
    # };
    #
    # headscale-acls = {
    #   file = ./headscale/acls.age;
    #   owner = "headscale";
    #   group = "headscale";
    # };

    linkding-environment = {
      file = ./linkding/environment.age;
    };

    mastodon-database-password = {
      file = ./mastodon/databasePassword.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-smtp-password = {
      file = ./mastodon/smtpPassword.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-otp-secret = {
      file = ./mastodon/otpSecret.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-secret-key-base = {
      file = ./mastodon/secretKeyBase.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-vapid-private-key = {
      file = ./mastodon/vapidPrivateKey.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-vapid-public-key = {
      file = ./mastodon/vapidPublicKey.age;
      owner = "mastodon";
      group = "mastodon";
    };

    mastodon-extra-config = {
      file = ./mastodon/extraConfig.age;
      owner = "mastodon";
      group = "mastodon";
    };

    miniflux-credentials = {
      file = ./miniflux/credentials.age;
    };

    mosquitto-password-weewx-proxy = {
      file = ./mosquitto/passwordWeewxProxy.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    mosquitto-password-weewx = {
      file = ./mosquitto/passwordWeewx.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    anonymous-overflow-config = {
      file = ./anonymous-overflow/config.age;
    };

    invidious-extra-settings = {
      file = ./invidious/extraSettings.age;
      mode = "444";
    };

    proxitok-environment = {
      file = ./proxitok/environment.age;
    };

    mautrix-signal-config = {
      file = ./mautrix-signal/config.age;
    };

    synapse-extra-config = {
      file = ./synapse/extraConfig.age;
      owner = "matrix-synapse";
      group = "matrix-synapse";
    };

    synapse-sliding-sync-config = {
      file = ./synapse/slidingSyncConfig.age;
    };

    mautrix-whatsapp-config = {
      file = ./mautrix-whatsapp/config.age;
    };

    weewx-config = {
      file = ./weewx/config.age;
      owner = "weewx";
      group = "weewx";
    };

    weewx-skin = {
      file = ./weewx/skin.age;
      path = "/var/lib/weewx-weather/overlay/upper/skins/weewx-wdc/skin.conf";
      owner = "weewx";
      group = "weewx";
    };
  };
}
