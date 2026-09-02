{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.woodpecker = {
    includes = with den.aspects; [
      woodpecker._.agent
    ];

    nixos =
      { config, ... }:
      let
        fqdn = "ci.kempkens.io";
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          woodpecker-environment = {
            file = ../../agenix/woodpecker/environment.age;
          };
        };

        services = {
          woodpecker-server = {
            enable = true;
            environment = {
              WOODPECKER_SERVER_ADDR = "127.0.0.1:8037";
              WOODPECKER_GRPC_ADDR = "127.0.0.1:8038";
              WOODPECKER_HOST = "https://${fqdn}";

              WOODPECKER_OPEN = "false";
              WOODPECKER_ADMIN = "daniel";
              WOODPECKER_LOG_LEVEL = "info";
              WOODPECKER_DATABASE_DRIVER = "postgres";
              WOODPECKER_DATABASE_DATASOURCE = "postgres:///woodpecker-server?host=/run/postgresql";

              WOODPECKER_FORGEJO = "true";
              WOODPECKER_FORGEJO_URL = "https://git.kempkens.io";
              WOODPECKER_AUTHENTICATE_PUBLIC_REPOS = "true";
              WOODPECKER_PLUGINS_TRUSTED_CLONE = "docker.io/woodpeckerci/plugin-git,quay.io/woodpeckerci/plugin-git,bash";

              WOODPECKER_ENABLE_SWAGGER = "false";
              WOODPECKER_DISABLE_VERSION_CHECK = "true";
              WOODPECKER_DISABLE_USER_AGENT_REGISTRATION = "true";
            };
            environmentFile = [ config.age.secrets.woodpecker-environment.path ];
          };

          postgresql = {
            ensureDatabases = [ "woodpecker-server" ];
            ensureUsers = [
              {
                name = "woodpecker-server";
                ensureDBOwnership = true;
              }
            ];
          };
        };
      };
  };
}
