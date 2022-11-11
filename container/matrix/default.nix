let
  secret = import ../../secret/container/matrix;
  custom-config = import ./config.nix { inherit secret; };
in
{
  virtualisation.arion.projects.matrix.settings = {
    services = {
      synapse = {
        service = {
          image = "matrixdotorg/synapse:latest";
          container_name = "synapse";
          restart = "unless-stopped";
          volumes = [
            "/etc/container-matrix/synapse:/data"
          ];
          labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.matrix.rule" = "Host(`matrix.kempkens.io`)";
            "traefik.http.routers.matrix.entrypoints" = "websecure";
            "traefik.http.routers.matrix.service" = "matrix-web";
            "traefik.http.routers.matrix.tls.certresolver" = "cfresolver";
            "traefik.http.routers.matrix.tls.domains[0].main" = "kempkens.io";
            "traefik.http.routers.matrix.tls.domains[0].sans" = "*.kempkens.io";
            "traefik.http.routers.matrix.middlewares" = "content-compression@file";
            "traefik.http.services.matrix-web.loadbalancer.server.port" = "8008";
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };
} // custom-config
