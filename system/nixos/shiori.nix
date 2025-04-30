{ config, ... }:

let
  fqdn = "shiori.internal.kempkens.network";
in
{
  services = {
    shiori = {
      enable = true;

      address = "127.0.0.1";
      port = 8018;

      databaseUrl = "postgres:///shiori?host=/run/postgresql";
      environmentFile = config.age.secrets.shiori-environment.path;
    };

    postgresql = {
      ensureDatabases = [ "shiori" ];

      ensureUsers = [
        {
          name = "shiori";
          ensureDBOwnership = true;
        }
      ];
    };

    nginx.virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8018";
      };
    };
  };
}
