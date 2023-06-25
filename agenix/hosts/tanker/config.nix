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
    };

    atuin-environment = {
      file = ./atuin/environment.age;
    };

    atticd-environment = {
      file = ./atticd/environment.age;
    };

    fedifetcher-config = {
      file = ./fedifetcher/config.age;
      symlink = false;
      path = "/var/lib/fedifetcher/config.json";
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
      symlink = false;
      path = "/var/lib/matrix-bridges/signal/config.yaml";
      mode = "640";
      owner = "1337";
      group = "1337";
    };

    signald-environment = {
      file = ./signald/environment.age;
    };

    synapse-extra-config = {
      file = ./synapse/extraConfig.age;
      owner = "matrix-synapse";
      group = "matrix-synapse";
    };

    mautrix-whatsapp-config = {
      file = ./mautrix-whatsapp/config.age;
      symlink = false;
      path = "/var/lib/matrix-bridges/whatsapp/config.yaml";
      mode = "640";
      owner = "1337";
      group = "1337";
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
