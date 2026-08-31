{ inputs, ... }:

{
  flake-file.inputs = {
    deploy-rs.url = "github:serokell/deploy-rs";

    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";

    make-shell.url = "github:nicknovitski/make-shell";
  };

  imports = [
    inputs.make-shell.flakeModules.default
  ];

  perSystem =
    { pkgs, inputs', ... }:
    {
      make-shells.default.packages = with pkgs; [
        deploy-rs
        just
        nix-output-monitor
        (octodns.withProviders (_: [
          octodns-providers.bind
          inputs'.nifoc-overlay.packages.octodns-desec
        ]))
      ];
    };

  flake =
    { lib, config, ... }:
    {
      deploy.nodes = lib.mapAttrs' (
        hostname: nixosConfiguration:
        let
          inherit (nixosConfiguration.config.nixpkgs.hostPlatform) system;
        in
        {
          name = hostname;
          value = {
            inherit hostname;
            sshUser = "root";
            remoteBuild = true;
            autoRollback = false;
            magicRollback = false;
            confirmTimeout = 300;

            profiles.system = {
              path = inputs.deploy-rs.lib.${system}.activate.nixos nixosConfiguration;
            };
          };
        }
      ) config.nixosConfigurations;
    };
}
