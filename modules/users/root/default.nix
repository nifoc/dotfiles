{ den, ... }:

{
  den.aspects.root = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;

        inherit (den.aspects.${cfg.primaryUser}.meta) sshKeys;
        authorizedKeys = builtins.map (keyName: "${sshKeys.${keyName}}") cfg.ssh.authorizedKeys;
      in
      {
        users.users.root = {
          openssh.authorizedKeys.keys = authorizedKeys;
        };
      };
  };
}
