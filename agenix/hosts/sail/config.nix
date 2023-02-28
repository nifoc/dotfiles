{
  age.secrets = {
    cloudflared-environment = {
      file = ./cloudflared/environment.age;
      owner = "cloudflared";
      group = "cloudflared";
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

    atuin-environment = {
      file = ./atuin/environment.age;
      owner = "atuin";
      group = "atuin";
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

    nitter-config = {
      file = ./nitter/config.age;
      mode = "444";
    };

    nitter-auth = {
      file = ./nitter/auth.age;
      owner = "nginx";
      group = "nginx";
    };

    libreddit-auth = {
      file = ./libreddit/auth.age;
      owner = "nginx";
      group = "nginx";
    };

    anonymous-overflow-config = {
      file = ./anonymous-overflow/config.age;
      mode = "444";
    };

    anonymous-overflow-auth = {
      file = ./anonymous-overflow/auth.age;
      owner = "nginx";
      group = "nginx";
    };

    proxitok-environment = {
      file = ./proxitok/environment.age;
      mode = "444";
    };

    proxitok-auth = {
      file = ./proxitok/auth.age;
      owner = "nginx";
      group = "nginx";
    };
  };
}
