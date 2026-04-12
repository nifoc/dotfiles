{
  nixpkgs,
  # nixpkgs-master,
  disko,
  home-manager,
  agenix,
  quadlet-nix,
  direnv-instant,
  lix-overlay,
  nifoc-overlay,
  run0-sudo-shim,
}:

let
  default-system = "x86_64-linux";

  # overlay-master = _: _: {
  #   master = import nixpkgs-master { system = default-system; };
  # };

  nixpkgsConfig = {
    overlays = [
      lix-overlay
      nifoc-overlay.overlay
      # overlay-master
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;

      permittedInsecurePackages = [ ];
    };
  };
in
{
  arch = default-system;

  system = nixpkgs.lib.nixosSystem {
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

      disko.nixosModules.disko

      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.daniel = import ../../home/hosts/xenon.nix;
          extraSpecialArgs = {
            inputs = { inherit direnv-instant; };
          };
        };
      }

      agenix.nixosModules.default

      quadlet-nix.nixosModules.quadlet

      run0-sudo-shim.nixosModules.default

      ../hosts/xenon.nix
    ];
  };

  deployment = {
    hostname = "10.0.0.101";
    sshUser = "root";
    remoteBuild = true;
    autoRollback = false;
    magicRollback = false;
  };
}
