{ secret, ... }:

{
  services.ntfy-sh = {
    enable = true;

    settings = {
      base-url = "https://ntfy.kempkens.io";
      listen-http = "127.0.0.1:8004";
      behind-proxy = true;

      auth-file = "/var/lib/ntfy-sh/user.db";
      auth-default-access = "deny-all";

      cache-file = "/var/lib/ntfy-sh/cache.db";
      attachment-cache-dir = "/var/lib/ntfy-sh/cache-attachments";

      upstream-base-url = "https://ntfy.sh";
      keepalive-interval = "45s";

      inherit (secret.ntfy) web-push-public-key web-push-private-key web-push-email-address;
      web-push-file = "/var/lib/ntfy-sh/webpush.db";
    };
  };

  services.nginx.virtualHosts."ntfy.kempkens.io" = {
    quic = true;
    http3 = true;

    forceSSL = true;
    useACMEHost = "kempkens.io";

    extraConfig = ''
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyWebsockets = true;
      proxyPass = "http://127.0.0.1:8004";
    };
  };
}
