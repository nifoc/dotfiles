{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.media-downloader = {
    includes = with den.aspects; [
      podman
    ];

    nixos =
      { config, ... }:
      let
        inherit (config.virtualisation.quadlet) containers;

        internalGW = "192.168.42.9";
        dataDir = "/var/lib/omegabrr";
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.omegabrr = {
          containerConfig = {
            image = "ghcr.io/autobrr/omegabrr:latest";
            volumes = [ "${dataDir}:/config" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
            podmanArgs = [
              "--add-host=sonarr.internal.kempkens.network:${internalGW}"
              "--add-host=radarr.internal.kempkens.network:${internalGW}"
            ];
          };

          unitConfig = {
            Requires = [
              containers.autobrr.ref
              containers.radarr.ref
              containers.sonarr.ref
            ];
            After = [
              containers.autobrr.ref
              containers.radarr.ref
              containers.sonarr.ref
            ];
          };
        };

        systemd.tmpfiles.rules = [
          "d ${dataDir} 0755 root root"
        ];
      };
  };
}
