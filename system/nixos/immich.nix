{ config, ... }:

{
  services = {
    immich = {
      enable = true;

      mediaLocation = "/dozer/MediaVault/Immich";

      database = {
        enable = true;
        createDB = true;

        enableVectorChord = true;
        enableVectors = false;
      };

      machine-learning = {
        enable = true;
      };
    };

    caddy.virtualHosts = {
      "immich.internal.kempkens.network" = {

        extraConfig = ''
          encode

          request_body {
            max_size 1GB 
          }

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          reverse_proxy ${config.services.immich.host}:${toString config.services.immich.port} {
            flush_interval -1
          }
        '';
      };
    };
  };
}
