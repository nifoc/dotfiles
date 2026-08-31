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

        dataDir = "/var/lib/recyclarr";
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.recyclarr = {
          containerConfig = {
            image = "ghcr.io/recyclarr/recyclarr:latest";
            environments = {
              "TZ" = "Etc/UTC";
            };
            volumes = [ "${dataDir}:/config" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };

          unitConfig = {
            Requires = [
              containers.radarr.ref
              containers.sonarr.ref
            ];
            After = [
              containers.radarr.ref
              containers.sonarr.ref
            ];
          };
        };

        systemd.tmpfiles.rules = [
          "d ${dataDir} 0755 1000 1000"
        ];
      };
  };
}
