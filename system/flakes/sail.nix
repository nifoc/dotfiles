{ nixpkgs, ... }:

{
  nixosConfigurations.sail = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../hosts/sail.nix
    ];
  };
}
