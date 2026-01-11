{
  nixpkgs,
  home-manager,
  nix-darwin,
  agenix,
  direnv-instant,
  elixir-expert,
  lix-overlay,
  nifoc-overlay,
  nedeco,
}:

let
  default-system = "aarch64-darwin";

  overlay-x86 = _: _: { pkgs-x86 = import nixpkgs { system = "x86_64-darwin"; }; };

  overlay-elixir-expert = _: _: { elixir-expert = elixir-expert.packages.${default-system}.expert; };

  nixpkgsConfig = {
    overlays = [
      lix-overlay
      overlay-x86
      agenix.overlays.default
      overlay-elixir-expert
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

          extraSpecialArgs = {
            inputs = { inherit direnv-instant; };
          };
        };
      }

      agenix.darwinModules.default

      nedeco.darwinModules.standard

      ../hosts/Styx.nix
    ];
  };
}
