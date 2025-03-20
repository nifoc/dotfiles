{ pkgs, config, ... }:

let
  fqdn = "vault.kempkens.network";
in
{
  services = {
    vaultwarden = {
      enable = true;
      dbBackend = "postgresql";

      environmentFile = config.age.secrets.vaultwarden-config.path;
      config = {
        DOMAIN = "https://${fqdn}";
        SIGNUPS_ALLOWED = false;
        EXPERIMENTAL_CLIENT_FEATURE_FLAGS = "ssh-key-vault-item,ssh-agent";

        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;

        DATABASE_URL = "postgresql:///vaultwarden?host=/run/postgresql";

        USE_SENDMAIL = true;
        SMTP_FROM = "vaultwarden@mg.kempkens.io";
        SENDMAIL_COMMAND = "${pkgs.system-sendmail}/bin/sendmail";
      };
    };

    postgresql = {
      ensureDatabases = [ "vaultwarden" ];

      ensureUsers = [
        {
          name = "vaultwarden";
          ensureDBOwnership = true;
        }
      ];
    };

    nginx.virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "kempkens.network";

      extraConfig = ''
        access_log /var/log/nginx/access_${fqdn}.log combined buffer=32k flush=5m;

        client_max_body_size 40m;
      '';

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://${config.services.vaultwarden.config.ROCKET_ADDRESS}:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        proxyWebsockets = true;
      };
    };
  };

  systemd.services.vaultwarden = {
    requires = [ "postgresql.service" ];
    restartTriggers = [ "${config.age.secrets.vaultwarden-config.file}" ];
  };
}
