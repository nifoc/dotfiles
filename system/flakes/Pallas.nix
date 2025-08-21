{
  nixpkgs,
  lix-module,
  home-manager,
  nix-darwin,
  agenix,
  nifoc-overlay,
}:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };

  nixpkgsConfig = {
    overlays = [
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
  arch = default-system;

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
          users.daniel = import ../../home/hosts/Pallas.nix;
        };
      }

      agenix.darwinModules.default

      ../hosts/Pallas.nix
    ];
  };

  # deployment = {
  #   hostname = "";
  #   sshUser = "daniel";
  #   remoteBuild = false;
  #   fastConnection = true;
  #   interactiveSudo = true;
  #   autoRollback = false;
  #   magicRollback = false;
  # };
}
