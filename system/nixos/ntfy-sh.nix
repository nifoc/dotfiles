{ secret, ... }:

{
  services.ntfy-sh = {
    enable = true;

    settings = {
      base-url = secret.ntfy.baseUrl;
      listen-unix = "/run/ntfy-sh/ntfy.socket";
      behind-proxy = true;

      auth-file = "/var/lib/ntfy-sh/user.db";
      auth-default-access = "deny-all";

      cache-file = "/var/lib/ntfy-sh/cache.db";
      attachment-cache-dir = "/var/cache/ntfy/attachments";

      keepalive-interval = "45s";
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."${secret.ntfy.web-domain}" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      forceSSL = false;
      enableACME = false;

      locations."/" = {
        tryFiles = "$uri @proxy";
      };

      locations."@proxy" = {
        proxyWebsockets = true;
        recommendedProxySettings = true;
        proxyPass = "http://unix:/run/ntfy-sh/ntfy.socket";
      };
    };
  };
}
