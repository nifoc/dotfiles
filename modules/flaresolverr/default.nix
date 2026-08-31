{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.flaresolverr = {
    includes = with den.aspects; [
      podman
    ];

    nixos = {
      imports = [
        inputs.quadlet-nix.nixosModules.quadlet
      ];

      virtualisation.quadlet.containers.flaresolverr = {
        containerConfig = {
          image = "ghcr.io/flaresolverr/flaresolverr:latest";
          environments = {
            "TZ" = "Etc/UTC";
            "HOST" = "192.168.42.2";
            "PORT" = "8191";
          };
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
            "io.containers.autoupdate" = "registry";
          };
        };
      };
    };
  };
}
