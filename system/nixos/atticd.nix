{ pkgs, config, secret, ... }:

let
  fqdn = "attic.cache.daniel.sx";
in
{
  environment.systemPackages = [ pkgs.attic-client ];

  services.atticd = {
    enable = true;

    credentialsFile = config.age.secrets.atticd-environment.path;

    settings = {
      listen = "127.0.0.1:8080";
      database.url = "postgresql://attic?host=10.99.99.3&user=attic";

      allowed-hosts = [ "${fqdn}" ];
      api-endpoint = "https://${fqdn}/";

      storage = {
        type = "s3";
        region = "auto";
        bucket = "attic-cache";
        endpoint = "https://${secret.cloudflare.account-id}.r2.cloudflarestorage.com";
      };

      chunking = {
        nar-size-threshold = 64 * 1024; # 64 KiB
        min-size = 16 * 1024; # 16 KiB
        avg-size = 64 * 1024; # 64 KiB
        max-size = 256 * 1024; # 256 KiB
      };

      garbage-collection = {
        interval = "12 hours";
        default-retention-period = "3 months";
      };
    };
  };

  services.nginx.virtualHosts."${fqdn}" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "cache.daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8080";
    };
  };
}
