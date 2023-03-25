{
  age.secrets = {
    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
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

    synapse-extra-config = {
      file = ./synapse/extraConfig.age;
      owner = "matrix-synapse";
      group = "matrix-synapse";
    };

    signald-environment = {
      file = ./signald/environment.age;
    };

    weewx-config = {
      file = ./weewx/config.age;
      symlink = false;
      path = "/etc/container-weewx/weewx.conf";
      mode = "644";
      owner = "421";
      group = "421";
    };

    weewx-skin = {
      file = ./weewx/skin.age;
      symlink = false;
      path = "/etc/container-weewx/skin-wdc/skin.conf";
      mode = "644";
      owner = "421";
      group = "421";
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

    atuin-environment = {
      file = ./atuin/environment.age;
    };

    freshrss-user-password = {
      file = ./freshrss/userPassword.age;
      owner = "freshrss";
      group = "freshrss";
    };

    freshrss-database-password = {
      file = ./freshrss/databasePassword.age;
      owner = "freshrss";
      group = "freshrss";
    };

    invidious-database-password = {
      file = ./invidious/databasePassword.age;
      mode = "444";
    };

    nitter-config = {
      file = ./nitter/config.age;
    };

    anonymous-overflow-config = {
      file = ./anonymous-overflow/config.age;
    };

    proxitok-environment = {
      file = ./proxitok/environment.age;
    };
  };
}
