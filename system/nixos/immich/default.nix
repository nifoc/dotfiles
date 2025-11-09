args@{
  config,
  host ? "localhost",
  ...
}:

{
  imports = [
    (import ./machine-learning.nix (
      args
      // {
        inherit host;
      }
    ))
  ];

  services = {
    immich = {
      enable = true;

      inherit host;

      mediaLocation = "/dozer/MediaVault/Immich";

      database = {
        enable = true;
        createDB = true;

        enableVectorChord = true;
        enableVectors = false;
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
