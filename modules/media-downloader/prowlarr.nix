{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.media-downloader = {
    includes = with den.aspects; [
      flaresolverr
      podman
    ];

    nixos =
      { config, ... }:
      let
        inherit (config.virtualisation.quadlet) containers;
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        virtualisation.quadlet.containers.prowlarr = {
          containerConfig = {
            image = "lscr.io/linuxserver/prowlarr:latest";
            environments = {
              "PUID" = "2001";
              "PGID" = "2001";
              "TZ" = "Etc/UTC";
              "PROWLARR__AUTH__TRUSTCGNATIPADDRESSES" = "true";
            };
            volumes = [ "/var/lib/prowlarr:/config" ];
            labels = {
              "com.centurylinklabs.watchtower.enable" = "true";
              "io.containers.autoupdate" = "registry";
            };
          };

          unitConfig = {
            Requires = [ containers.flaresolverr.ref ];
            After = [ containers.flaresolverr.ref ];
          };
        };

        systemd.tmpfiles.rules = [
          "d /var/lib/prowlarr 0755 media_user user_media"
        ];

        services.caddy = {
          virtualHosts."prowlarr.internal.kempkens.network" = {
            extraConfig = ''
              encode

              request_body {
                max_size 32MB
              }

              header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

              import tinyauth

              reverse_proxy 192.168.42.2:9696
            '';
          };
        };
      };
  };
}
