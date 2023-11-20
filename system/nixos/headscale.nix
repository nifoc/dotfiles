{ pkgs, config, ... }:
let
  fqdn = "ctrl.headscale.kempkens.network";
in
{
  environment.systemPackages = [ pkgs.headscale ];

  services = {
    headscale = {
      enable = true;

      address = "127.0.0.1";
      port = 8017;

      settings = {
        ip_prefixes = [
          "fd7a:115c:a1e0:1010::/64"
          "100.64.10.0/24"
        ];

        db_type = "postgres";
        db_host = "/run/postgresql";
        db_name = "headscale";
        db_user = "headscale";
        db_password_file = config.age.secrets.headscale-database-password.path;

        server_url = "https://${fqdn}";
        acl_policy_path = config.age.secrets.headscale-acls.path;

        dns_config = {
          override_local_dns = false;

          nameservers = [
            "100.64.10.1"
            "100.64.10.6"
          ];

          base_domain = "mesh.kempkens.network";
        };
      };
    };

    postgresql = {
      ensureDatabases = [ "headscale" ];

      ensureUsers = [
        {
          name = "headscale";
          ensureDBOwnership = true;
        }
      ];
    };

    nginx.virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "headscale.kempkens.network";

      extraConfig = ''
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
      '';

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8017";
        proxyWebsockets = true;
      };

      locations."/web" = {
        root = "${pkgs.headscale-ui}/share";
      };
    };
  };

  systemd.services.tailscaled.after = [ "headscale.service" ];
}
