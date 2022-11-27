{ secret, ... }:

{
  services.matrix-synapse = {
    enable = true;

    withJemalloc = true;

    settings = {
      server_name = "kempkens.io";
      public_baseurl = "https://matrix.kempkens.io/";

      listeners = [
        {
          bind_addresses = [ "127.0.0.1" "10.99.99.2" ];
          port = 8008;
          tls = false;
          type = "http";
          x_forwarded = true;
          resources = [
            {
              names = [ "client" "federation" ];
              compress = false;
            }
          ];
        }
      ];

      database = {
        name = "psycopg2";
        args = {
          host = "10.99.99.3";
          database = "synapse";
          inherit (secret.synapse.database) user;
          inherit (secret.synapse.database) password;
          cp_min = 5;
          cp_max = 10;
        };
      };

      email = {
        smtp_host = "smtp.mailgun.org";
        smtp_port = 465;
        smtp_user = secret.synapse.email.user;
        smtp_pass = secret.synapse.email.password;
        force_tls = true;
        notif_from = "%(app)s <matrix@mg.kempkens.io>";
        app_name = "kempkens_matrix";
      };

      thumbnail_sizes = [
        { width = 32; height = 32; method = "crop"; }
        { width = 96; height = 96; method = "crop"; }
        { width = 320; height = 240; method = "scale"; }
        { width = 640; height = 480; method = "scale"; }
        { width = 800; height = 600; method = "scale"; }
      ];

      url_preview_enabled = true;
      url_preview_ip_range_blacklist = [
        "10.0.0.0/8"
        "100.64.0.0/10"
        "127.0.0.0/8"
        "157.90.18.162/32"
        "169.254.0.0/16"
        "172.16.0.0/12"
        "192.0.0.0/24"
        "192.0.2.0/24"
        "192.168.0.0/16"
        "192.88.99.0/24"
        "198.18.0.0/15"
        "198.51.100.0/24"
        "2001:db8::/32"
        "203.0.113.0/24"
        "224.0.0.0/4"
        "::1/128"
        "fc00::/7"
        "fe80::/10"
        "fec0::/10"
        "ff00::/8"
        "2001:db8::/32"
        "2a01:4f8:c2c:989c::/64"
      ];

      inherit (secret.synapse) registration_shared_secret;
      inherit (secret.synapse) macaroon_secret_key;
      inherit (secret.synapse) form_secret;

      enable_metrics = false;
      report_stats = false;

      experimental_features = {
        msc3202_device_masquerading = true;
        msc3202_transaction_extensions = true;
        msc2409_to_device_messages_enabled = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 8008 ];
}
