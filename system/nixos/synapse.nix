{ config, ... }:

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
        };
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

      enable_registration = false;

      enable_metrics = false;
      report_stats = false;

      app_service_config_files = [
        "/etc/container-matrix/signal/registration.yaml"
        "/etc/container-matrix/whatsapp/registration.yaml"
      ];

      experimental_features = {
        msc3202_device_masquerading = true;
        msc3202_transaction_extensions = true;
        msc2409_to_device_messages_enabled = true;
      };
    };

    extraConfigFiles = [ config.age.secrets.synapse-extra-config.path ];
  };

  networking.firewall.interfaces."enp7s0".allowedTCPPorts = [ 8008 ];

  services.nginx.virtualHosts."matrix.kempkens.io" = {
    http3 = true;

    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations."~ ^(/_matrix|/_synapse/client)" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8008";
      proxyWebsockets = true;

      extraConfig = ''
        client_max_body_size 50m;
        proxy_force_ranges on;
      '';
    };
  };
}
