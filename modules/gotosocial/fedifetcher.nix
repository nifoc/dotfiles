{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.gotosocial = {
    nixos =
      {
        config,
        lib,
        inputs',
        ...
      }:
      let
        pkg = inputs'.nifoc-overlay.packages.fedifetcher;
      in
      {
        imports = [
          inputs.agenix.nixosModules.default
        ];

        age.secrets = {
          gotosocial-fedifetcher-config = {
            file = ../../agenix/gotosocial/fedifetcher/config.age;
          };
        };

        systemd.services.fedifetcher = {
          description = "FediFetcher";
          requires = [ "gotosocial.service" ];
          startAt = "*:0/25";

          serviceConfig = {
            Type = "oneshot";
            DynamicUser = true;
            StateDirectory = "fedifetcher";
            LoadCredential = "config.json:${config.age.secrets.gotosocial-fedifetcher-config.path}";
            ExecStart = "${lib.getExe pkg} --config=%d/config.json";
          };
        };
      };
  };
}
