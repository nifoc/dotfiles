{ nixpkgs, arion, ... }:

{
  nixosConfigurations.sail = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      arion.nixosModules.arion

      ../hosts/sail.nix
    ];
  };
}
