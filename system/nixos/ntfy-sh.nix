{ config, ... }:

let
  fqdn = "ntfy.kempkens.io";
in
{
  services = {
    ntfy-sh = {
      enable = true;

      settings = {
        base-url = "https://${fqdn}";
        listen-http = "127.0.0.1:8004";
        behind-proxy = true;

        auth-file = "/var/lib/ntfy-sh/user.db";
        auth-default-access = "deny-all";

        cache-file = "/var/lib/ntfy-sh/cache.db";
        attachment-cache-dir = "/var/lib/ntfy-sh/cache-attachments";

        upstream-base-url = "https://ntfy.sh";
        keepalive-interval = "45s";
      };
    };

    caddy.virtualHosts."${fqdn}" = {
      useACMEHost = "kempkens.io";

      extraConfig = ''
        encode

        header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

        reverse_proxy ${config.services.ntfy-sh.settings.listen-http}
      '';
    };
  };
}
