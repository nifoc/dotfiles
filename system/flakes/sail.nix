{ nixpkgs, arion, ... }:

let
  overlay-arion = arion.overlay;

  nixpkgsConfig = {
    overlays = [
      overlay-arion
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
in
{
  nixosConfigurations.sail = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ({ nixpkgs = nixpkgsConfig; })

      arion.nixosModules.arion

      ../hosts/sail.nix
    ];
  };
}
