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
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };
} // custom-config
