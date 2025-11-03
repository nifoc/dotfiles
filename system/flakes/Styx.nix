{
  nixpkgs,
  home-manager,
  nix-darwin,
  agenix,
  lix-overlay,
  nifoc-overlay,
  nedeco,
}:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };

  nixpkgsConfig = {
    overlays = [
      lix-overlay
      overlay-x86
      agenix.overlays.default
      nifoc-overlay.overlay
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
