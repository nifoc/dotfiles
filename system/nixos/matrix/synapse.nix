{ config, ... }:

let
  fqdn = "matrix.kempkens.io";
in
{
  services.matrix-synapse = {
    enable = true;

    withJemalloc = true;

    settings = {
      server_name = "kempkens.io";
      public_baseurl = "https://${fqdn}/";

      listeners = [
        {
          bind_addresses = [ "127.0.0.1" ];
          port = 8008;
          tls = false;
          type = "http";
          x_forwarded = true;
          resources = [
            {
              names = [
                "client"
                "federation"
              ];
              compress = false;
            }
          ];
        }
      ];

      database = {
        name = "psycopg2";
        args = {
          host = "/run/postgresql";
          user = "matrix-synapse";
          database = "synapse";
          cp_min = 5;
          cp_max = 10;
        };
      };

      thumbnail_sizes = [
        {
          width = 32;
          height = 32;
          method = "crop";
        }
        {
          width = 96;
          height = 96;
          method = "crop";
        }
        {
          width = 320;
          height = 240;
          method = "scale";
        }
        {
          width = 640;
          height = 480;
          method = "scale";
        }
        {
          width = 800;
          height = 600;
          method = "scale";
        }
      ];

      url_preview_enabled = true;
      url_preview_ip_range_blacklist = [
        "10.0.0.0/8"
        "94.130.142.168/32"
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
        "fd7a:115c:a1e0::/96"
        "fe80::/10"
        "fec0::/10"
        "ff00::/8"
        "2001:db8::/32"
        "2a01:4f8:c2c:989c::/64"
        "2a01:4f8:13b:2d81::/64"
      ];

      enable_registration = false;

      enable_metrics = false;
      report_stats = false;

      experimental_features = {
        msc3202_device_masquerading = true;
        msc3202_transaction_extensions = true;
        msc2409_to_device_messages_enabled = true;
      };
    };

    extraConfigFiles = [ config.age.secrets.synapse-extra-config.path ];
  };

  systemd.services.matrix-synapse.after = [ "postgresql.service" ];

  services.nginx.virtualHosts."${fqdn}" = {
    quic = true;
    http3 = true;

    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;

      location ~* ^(\/_matrix|\/_synapse\/client) {
        proxy_pass http://127.0.0.1:8008;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;

        client_max_body_size 50m;
        proxy_force_ranges on;
      }
    '';
  };
}
