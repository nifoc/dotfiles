{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.hister = {
    nixos =
      { config, ... }:
      {
        imports = [
          inputs.agenix.nixosModules.default
        ];

        age.secrets = {
          hister-environment = {
            file = ../../agenix/hister/environment.age;
          };
        };

        services.hister = {
          enable = true;

          environmentFile = config.age.secrets.hister-environment.path;

          dataDir = "/var/lib/hister";

          settings = {
            app = {
              user_handling = true;
              disable_previews = true;
              search_url = "https://kagi.com/search?q={query}";
              log_level = "info";
            };

            server = {
              address = "192.168.42.2:4433";
              base_url = "https://hister.internal.kempkens.network";
              oauth_only = true;
            };

            semantic_search.enable = false;
          };
        };
      };
  };
}
