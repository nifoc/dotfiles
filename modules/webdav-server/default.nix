{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.webdav-server = {
    nixos =
      { config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          webdav-server-environment = {
            file = ../../agenix/webdav-server/environment.age;
          };
        };

        services.webdav = {
          enable = true;

          environmentFile = config.age.secrets.webdav-server-environment.path;

          settings = {
            address = "127.0.0.1";
            port = 6065;
            behindProxy = true;
            permissions = "R";

            users = [
              {
                username = "diarium";
                password = "{env}ENV_PASSWORD_DIARIUM";
                directory = "/dozer/MediaVault/WebDAV/diarium";
                permissions = "CRUD";
              }
            ];
          };
        };
      };
  };
}
