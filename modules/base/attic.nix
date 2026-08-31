{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.base = {
    nixos =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets =
          let
            name = den.aspects.${config.networking.hostName}.meta.primaryUser;
            primaryUser = config.users.users.${name};
          in
          {
            attic-config = {
              file = ../../agenix/base/attic/config.age;
              path = "${primaryUser.home}/.config/attic/config.toml";
              mode = "600";
              owner = primaryUser.name;
              group = "users";
            };
          };

        environment.systemPackages = [ pkgs.attic-client ];
      };

    darwin =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.darwinModules.default ];

        age.secrets =
          let
            primaryUser = config.users.users.${config.system.primaryUser};
          in
          {
            attic-config = {
              file = ../../agenix/base/attic/config.age;
              path = "${primaryUser.home}/.config/attic/config.toml";
              mode = "600";
              owner = primaryUser.name;
              group = "staff";
            };
          };

        environment.systemPackages = [ pkgs.attic-client ];
      };
  };
}
