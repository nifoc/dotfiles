{
  age.secrets = {
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

    nitter-config = {
      file = ./nitter/config.age;
    };

    nitter-guest-accounts = {
      file = ./nitter/guestAccounts.age;
      mode = "555";
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

    signald-environment = {
      file = ./signald/environment.age;
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
      symlink = false;
      path = "/var/lib/weewx/weewx.conf";
      mode = "640";
      owner = "421";
      group = "421";
    };

    weewx-skin = {
      file = ./weewx/skin.age;
      symlink = false;
      path = "/var/lib/weewx/skin-wdc/skin.conf";
      mode = "644";
      owner = "421";
      group = "421";
    };
  };
}
