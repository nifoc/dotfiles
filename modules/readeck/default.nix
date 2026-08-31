{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.readeck = {
    nixos =
      { config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          readeck-environment = {
            file = ../../agenix/readeck/environment.age;
          };
        };

        services = {
          readeck = {
            enable = true;

            environmentFile = config.age.secrets.readeck-environment.path;

            settings = {
              main = {
                log_level = "info";
                log_format = "text";
              };

              server = {
                host = "127.0.0.1";
                port = 8020;
                trusted_proxies = [ "127.0.0.1" ];
              };

              database = {
                source = "postgres://readeck@localhost/readeck?host=/run/postgresql";
              };

              auth.oidc.providers = [
                {
                  name = "PocketID";
                  url = "https://id.kempkens.network";
                }
              ];
            };
          };

          postgresql = {
            ensureDatabases = [ "readeck" ];

            ensureUsers = [
              {
                name = "readeck";
                ensureDBOwnership = true;
              }
            ];
          };
        };

        systemd.services.readeck = {
          requires = [ "postgresql.service" ];
          after = [ "postgresql.service" ];
        };
      };
  };
}
