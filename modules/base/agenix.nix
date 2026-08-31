{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.base = {
    nixos = {
      imports = [ inputs.agenix.nixosModules.default ];
    };

    darwin =
      { config, ... }:
      let
        primaryUser = config.users.users.${config.system.primaryUser};
      in
      {
        imports = [ inputs.agenix.darwinModules.default ];

        age = {
          identityPaths = [ "${primaryUser.home}/.ssh/agenix" ];
        };
      };
  };
}
