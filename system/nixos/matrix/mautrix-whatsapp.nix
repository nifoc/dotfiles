{ config, ... }:

{
  services.mautrix-whatsapp = {
    enable = true;
    serviceDependencies = [ "conduwuit.service" ];

    environmentFile = config.age.secrets.mautrix-whatsapp.path;
    # Settings have to be written in the old format: https://github.com/mautrix/whatsapp/blob/v0.10.9/example-config.yaml
    # Update once this is merged: https://github.com/NixOS/nixpkgs/pull/350448
    settings = {
      backfill = {
        enabled = true;
      };

      bridge = {
        message_status_events = true;

        encryption = {
          allow = true;
          default = true;
        };

        history_sync.backfill = true;

        login_shared_secret_map = {
          "kempkens.io" = "$DOUBLE_PUPPET_SECRETS_HOMESERVER";
        };

        permissions = {
          "*" = "relay";
          "kempkens.io" = "user";
          "@daniel:kempkens.io" = "admin";
        };

        provisioning = {
          shared_secret = "$PROVISIONING_SHARED_SECRET";
        };
      };

      homeserver = {
        address = "http://127.0.0.1:6167";
        domain = "kempkens.io";
      };
    };
  };
}
