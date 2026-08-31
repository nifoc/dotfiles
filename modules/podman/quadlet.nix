{ inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.podman = {
    nixos = {
      imports = [ inputs.quadlet-nix.nixosModules.quadlet ];

      virtualisation = {
        quadlet = {
          enable = true;
          autoEscape = true;
        };
      };
    };
  };
}
