{
  nixpkgs,
  lix-module,
  home-manager,
  nix-darwin,
  agenix,
  mkalias,
  nifoc-overlay,
  nedeco,
}:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };
  overlay-mkalias = _: _: { inherit (mkalias.packages.${default-system}) mkalias; };

  nixpkgsConfig = {
    overlays = [
      overlay-x86
      agenix.overlays.default
      nifoc-overlay.overlay
      overlay-mkalias
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
in
{
  system = nix-darwin.lib.darwinSystem {
    system = default-system;
    modules = [
      {
        nixpkgs = nixpkgsConfig;
        nix = {
          registry.nixpkgs.to = {
            type = "path";
            path = nixpkgs.outPath;
          };
          nixPath = nixpkgs.lib.mkForce [ "nixpkgs=flake:nixpkgs" ];
        };
      }

      lix-module.nixosModules.default

      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;

          sharedModules = [ nedeco.homeManagerModules.minimal ];

          users.dkempkens = import ../../home/hosts/Styx.nix;
        };
      }

      agenix.darwinModules.default

      nedeco.darwinModules.standard

      ../hosts/Styx.nix
    ];
  };
}
