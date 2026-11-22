{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.tailscale = {
    nixos =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          tailscale-authkey = {
            file = ../../agenix/tailscale/authkey.age;
          };
        };

        environment.systemPackages = [ pkgs.tailscale ];

        services.tailscale = {
          enable = true;
          authKeyFile = config.age.secrets.tailscale-authkey.path;

          disableUpstreamLogging = true;

          extraUpFlags = [
            "--stateful-filtering"
            "--accept-dns=false"
          ];
        };
      };
  };
}
