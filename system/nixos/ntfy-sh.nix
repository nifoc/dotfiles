{ secret, ... }:

{
  services.ntfy-sh = {
    enable = true;

    settings = {
      base-url = secret.ntfy.baseUrl;
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
}
