{ den, ... }:

{
  den.aspects.webserver.provides.storage = {
    includes = with den.aspects; [
      webserver
    ];

    nixos = {
      services = {
        postgresql = {
          authentication = ''
            host caddy_storage caddy_storage 100.116.103.122/32 md5
            host caddy_storage caddy_storage 100.90.7.38/32 md5
            host caddy_storage caddy_storage 100.97.247.57/32 md5
            host caddy_storage caddy_storage 100.83.191.69/32 md5
            host caddy_storage caddy_storage 100.111.49.64/32 md5
            host caddy_storage caddy_storage 100.124.128.35/32 md5
          '';
        };

        postgresqlBackup.databases = [ "caddy_storage" ];
      };
    };
  };
}
