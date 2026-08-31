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

        fqdn = "autobrr.internal.kempkens.network";
        internalGW = "192.168.42.9";
        dataDir = "/var/lib/autobrr";
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.autobrr = {
          containerConfig = {
            image = "ghcr.io/autobrr/autobrr:latest";
            environments = {
              "TZ" = "Europe/Berlin";
            };
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
          "d ${dataDir} 0755 root root"
        ];

        services.caddy = {
          virtualHosts."${fqdn}" = {
            extraConfig = ''
              encode

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              reverse_proxy 192.168.42.10:7474
            '';
          };
        };
      };
  };
}
