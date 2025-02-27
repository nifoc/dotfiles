{ pkgs, config, ... }:

let
  fqdn = "attic.cache.daniel.sx";
in
{
  environment.systemPackages = [ pkgs.attic-client ];

  services.atticd = {
    enable = true;

    environmentFile = config.age.secrets.atticd-environment.path;

    settings = {
      listen = "127.0.0.1:8080";
      database.url = "postgresql:///attic?host=/run/postgresql";

      allowed-hosts = [ "${fqdn}" ];
      api-endpoint = "https://${fqdn}/";

      storage = {
        type = "local";
        path = "/var/lib/atticd-data";
      };

      chunking = {
        nar-size-threshold = 64 * 1024; # 64 KiB
        min-size = 16 * 1024; # 16 KiB
        avg-size = 64 * 1024; # 64 KiB
        max-size = 256 * 1024; # 256 KiB
      };

      garbage-collection = {
        interval = "24 hours";
        default-retention-period = "6 weeks";
      };
    };
  };

  systemd.services.atticd.serviceConfig = {
    Restart = "on-failure";
  };

  services.postgresql = {
    ensureDatabases = [ "attic" ];

    ensureUsers = [
      {
        name = "atticd";
      }
    ];
  };

  services.nginx.virtualHosts."${fqdn}" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    extraConfig = ''
      client_max_body_size 0;

      proxy_read_timeout 300s;
      proxy_send_timeout 300s;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8080";
    };
  };
}
