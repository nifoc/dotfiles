{ self, ... }:

{
  perSystem =
    {
      pkgs,
      lib,
      system,
      inputs',
      ...
    }:
    {
      checks =
        let
          machinesPerSystem = {
            aarch64-linux = [
              "argon"
              "carbon"
              "neon"
            ];

            x86_64-linux = [
              "boron"
              "gallium"
              "krypton"
              "xenon"
            ];

            aarch64-darwin = [
              "Pallas"
            ];
          };

          nixMachines = lib.mapAttrs' (n: lib.nameValuePair "nix-config-${n}") (
            lib.genAttrs (machinesPerSystem.${system} or [ ]) (
              name:
              (self.nixosConfigurations.${name} or self.darwinConfigurations.${name}).config.system.build.toplevel
            )
          );
        in
        nixMachines
        // {
          deploy-rs = pkgs.runCommand "test-deploy-rs" { } ''
            ${inputs'.deploy-rs.packages.default}/bin/deploy --help > $out
          '';
        };
    };
}
