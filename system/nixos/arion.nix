{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };

    oci-containers = {
      backend = "docker";

      containers.watchtower = {
        image = "containrrr/watchtower";
        environment = {
          WATCHTOWER_POLL_INTERVAL = "28800";
          WATCHTOWER_LABEL_ENABLE = "true";
        };
        volumes = [ "/var/run/docker.sock:/var/run/docker.sock" ];
      };
    };

    arion = {
      backend = "docker";
    };
  };
}
