{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.miniflux = {
    nixos =
      { config, ... }:
      let
        fqdn = "feeds.kempkens.io";
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          miniflux-credentials = {
            file = ../../agenix/miniflux/credentials.age;
          };
        };

        services = {
          miniflux = {
            enable = true;

            config = {
              LISTEN_ADDR = "127.0.0.1:8016";
              BASE_URL = "https://${fqdn}/";
              POLLING_FREQUENCY = "25";
            };

            adminCredentialsFile = config.age.secrets.miniflux-credentials.path;
          };

          caddy.virtualHosts."${fqdn}" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"

              reverse_proxy ${config.services.miniflux.config.LISTEN_ADDR}
            '';
          };
        };
      };
  };
}
