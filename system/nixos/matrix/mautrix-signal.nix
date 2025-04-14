{ config, ... }:

{
  services.mautrix-signal = {
    enable = true;
    serviceDependencies = [ "conduwuit.service" ];

    environmentFile = config.age.secrets.mautrix-signal.path;
    settings = {
      backfill = {
        enabled = true;
      };

      bridge = {
        permissions = {
          "*" = "relay";
          "kempkens.io" = "user";
          "@daniel:kempkens.io" = "admin";
        };
      };

      double_puppet = {
        secrets = {
          "kempkens.io" = "$DOUBLE_PUPPET_SECRETS_HOMESERVER";
        };
      };

      encryption = {
        allow = true;
        default = true;
        pickle_key = "$ENCRYPTION_PICKLE_KEY";
      };

      homeserver = {
        address = "http://127.0.0.1:6167";
        domain = "kempkens.io";
      };

      matrix = {
        message_status_events = true;
      };

      provisioning = {
        shared_secret = "$PROVISIONING_SHARED_SECRET";
      };
    };
  };
}
